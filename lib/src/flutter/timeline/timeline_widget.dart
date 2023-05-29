import 'package:flutter/material.dart';

import '../../../velocity_x.dart';
import 'timeline_view.dart';

/// To show a timeline view with filled dot, header and description. Great for showing something like a history
class VxTimeline extends StatefulWidget {
  final List<VxTimelineModel> timelineList;

  final Color? lineColor;

  final Color? backgroundColor;
  final Color? trailingColor;

  final Color? headingColor;

  final Color? descriptionColor;
  final ValueSetter<VxTimelineModel>? onItemTap;
  final Duration? animationDuration;
  final bool showTrailing;
  final Widget? customTrailing;

  const VxTimeline(
      {super.key,
      required this.timelineList,
      this.lineColor,
      this.backgroundColor,
      this.trailingColor,
      this.headingColor,
      this.descriptionColor,
      this.onItemTap,
      this.animationDuration,
      this.showTrailing = false,
      this.customTrailing});

  @override
  VxTimelineState createState() {
    return VxTimelineState();
  }
}

class VxTimelineState extends State<VxTimeline>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  double fraction = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration:
            widget.animationDuration ?? const Duration(milliseconds: 1000),
        vsync: this);
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.timelineList.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () => widget.onItemTap!(widget.timelineList[index]),
          child: VxTimelineView(
            lineColor:
                widget.lineColor ?? Theme.of(context).colorScheme.secondary,
            backgroundColor: widget.backgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
            trailingColor:
                widget.trailingColor ?? Theme.of(context).colorScheme.secondary,
            model: widget.timelineList[index],
            firstElement: index == 0,
            lastElement: widget.timelineList.length == index + 1,
            controller: controller,
            headingColor: widget.headingColor ??
                Theme.of(context).colorScheme.onBackground,
            descriptionColor: widget.descriptionColor ??
                Theme.of(context).colorScheme.onBackground,
            hideLauncher: !widget.showTrailing,
            trailing: widget.customTrailing,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
