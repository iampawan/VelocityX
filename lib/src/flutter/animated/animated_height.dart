import 'dart:async';

import 'package:flutter/material.dart';

class VxAnimatedHeightView<T extends Widget> extends StatefulWidget {
  final T pageViewChild;

  final double Function(int? currentIndex) computeAspectRadio;

  final Function(ScrollNotification scrollNotification)? notifyScroll;

  final int itemCount;

  final int? currentPageIndex;

  const VxAnimatedHeightView(
      {super.key,
      required this.pageViewChild,
      required this.computeAspectRadio,
      this.notifyScroll,
      required this.itemCount,
      this.currentPageIndex})
      : assert(itemCount > 0);

  @override
  State<StatefulWidget> createState() {
    return _VxAnimatedHeightViewState();
  }
}

class _VxAnimatedHeightViewState extends State<VxAnimatedHeightView> {
  StreamController<double>? _streamController;
  Stream<double>? _headerStream;

  late List<double> _hisAspectRadioList;

  int? _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _hisAspectRadioList = List.filled(widget.itemCount, 0);
    _streamController = StreamController.broadcast();
    _headerStream = _streamController!.stream;
  }

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = StreamBuilder(
      stream: _headerStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return AspectRatio(
          aspectRatio:
              snapshot.data ?? widget.computeAspectRadio(_currentIndex) ?? 1.0,
          child: widget.pageViewChild,
        );
      },
    );
    child = NotificationListener<ScrollNotification>(
      child: child,
      onNotification: (scrollNotification) {
        if (widget.notifyScroll != null) {
          widget.notifyScroll!(scrollNotification);
        }
        if (scrollNotification.depth == 0) {
          _computeRadioToRadio(scrollNotification);
        }
        return true;
      },
    );
    return Listener(
      child: child,
      onPointerDown: (event) {
        _currentIndex = widget.currentPageIndex;
//          print("_currentIndex is $_currentIndex");
      },
    );
  }

  void _computeRadioToRadio(ScrollNotification scroll) {
    final int beforeIndex = _currentIndex!;
    int nextIndex;

    // Selected left margin
    final double currentLeftPixels =
        beforeIndex * scroll.metrics.viewportDimension;

    //Swipe right
    if (scroll.metrics.pixels > currentLeftPixels) {
      nextIndex = beforeIndex + 1;
    } else if (scroll.metrics.pixels < currentLeftPixels) {
      //Swipe left
      nextIndex = beforeIndex - 1;
    } else {
      return;
    }
    nextIndex = nextIndex.clamp(0, widget.itemCount - 1);

//    print(
//        "compute ,beforeIndex is $beforeIndex , nextIndex is $nextIndex");

    final double beforeRadio = getRadio(beforeIndex);
    final double nextRadio = getRadio(nextIndex);

    final double animationValue = beforeRadio +
        (nextRadio - beforeRadio) *
            ((scroll.metrics.pixels -
                        beforeIndex * scroll.metrics.viewportDimension)
                    .abs() /
                scroll.metrics.viewportDimension);
//    print(
//        "compute currentRadio is ${beforeRadio},nextRadio is ${nextRadio}  new radio is $animationValue，scroll.metrics.pixels is ${scroll.metrics.pixels} ,"
//            "beforeIndex is $beforeIndex,nextIndex is $nextIndex, animation is ${((scroll.metrics.pixels -
//            beforeIndex * scroll.metrics.viewportDimension)
//            .abs() /
//            scroll.metrics.viewportDimension)}");
    _streamController!.add(animationValue);
  }

  double getRadio(int index) {
    if (_hisAspectRadioList[index] > 0) {
      return _hisAspectRadioList[index];
    }
    final double radio = widget.computeAspectRadio(index);
    _hisAspectRadioList[index] = radio;
    return radio;
  }
}
