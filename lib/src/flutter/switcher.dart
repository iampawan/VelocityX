import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/velocity_xx.dart';

typedef OnRetry = void Function();
typedef OnStateChanged = Widget Function(VxPageState state);

enum VxPageState {
  none,
  loading, // loading
  empty, // empty data page
  error, // error page
  content, // data content
  netError, // network error
}

class VxStateSwitcher extends StatefulWidget {
  /// page status
  final VxPageState? pageState;

  /// Retry callback
  final OnRetry? onRetry;

  /// Skeleton screen
  final Widget? skeleton;

  /// empty page
  final Widget? emptyView;

  /// error page
  final Widget? errorView;

  /// Subassembly
  final Widget? child;

  const VxStateSwitcher({
    super.key,
    this.pageState,
    this.onRetry,
    this.skeleton,
    this.emptyView,
    this.errorView,
    this.child,
  });

  @override
  VxStateSwitcherState createState() => VxStateSwitcherState();
}

class VxStateSwitcherState extends State<VxStateSwitcher> {
  VxPageState? _pageState = VxPageState.none;

  @override
  void initState() {
    super.initState();
    _pageState = widget.pageState;
  }

  @override
  void didUpdateWidget(VxStateSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageState = widget.pageState;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: renderStatePage(_pageState),
    );
  }

  /// Render the corresponding page according to the state value
  Widget? renderStatePage(VxPageState? pageState) {
    switch (pageState) {
      /// Loading...
      case VxPageState.loading:
        if (widget.skeleton != null) {
          return widget.skeleton;
        }
        return Container(
          alignment: Alignment.center,
          child: _getIndicator(context),
        );

      /// empty page
      case VxPageState.empty:
        if (widget.emptyView != null) {
          return widget.emptyView;
        }
        return getStatePage(
          placeholder: ElevatedButton(
              onPressed: () {
                setState(() => _pageState = VxPageState.loading);
                widget.onRetry?.call();
              },
              child: const Text("Retry")),
          text: "Nothing to show",
        );

      /// error page
      case VxPageState.error:
        if (widget.errorView != null) {
          return widget.errorView;
        }
        return getStatePage(
          text: "Some error occured, please try again",
          placeholder: ElevatedButton(
              onPressed: () {
                setState(() => _pageState = VxPageState.loading);
                widget.onRetry?.call();
              },
              child: const Text("Retry")),
        );

      /// Normal content page
      default:
        return widget.child;
    }
  }

  /// Loading
  Widget _getIndicator(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? const CupertinoActivityIndicator(
            animating: true,
            radius: 16.0,
          )
        : CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          );
  }

  Widget getStatePage({Widget? placeholder, required String text}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          placeholder!,
        ],
      ),
    );
  }
}

/// VxSwitcher can be used for Desktop and mobile platforms to change the state using AnimatedSwitcher in case of using mobile.
class VxSwitcher extends StatelessWidget {
  final Widget child;

  const VxSwitcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Vx.isDesktop
        ? child
        : AnimatedSwitcher(
            key: key,
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: child,
          );
  }
}
