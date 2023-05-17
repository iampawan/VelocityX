import 'dart:async';

import 'package:flutter/material.dart';

import 'common/velocity_round.dart';

enum VxPreviewIndicatorAxis { horizontal, vertical }

mixin VxPreview {
  static void show(
    BuildContext context, {
    GlobalKey? key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    Axis scrollDirection = Axis.horizontal,
    int defaultIndex = 0,
    bool loop = true,
    int speed = 280,
    Curve curve = Curves.bounceIn,
    Function(int index)? onChanged,
    bool indicators = true,
    VxPreviewIndicatorAxis fPreviewIndicatorAxis =
        VxPreviewIndicatorAxis.horizontal,
    Color unSelectPointColor = Colors.white,
    Color selectPointColor = Colors.red,
  }) {
    final Widget child = _VxPreview(
      key: key ?? GlobalKey(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      scrollDirection: scrollDirection,
      defaultIndex: defaultIndex,
      loop: loop,
      speed: speed,
      curve: curve,
      onChanged: onChanged,
      indicators: indicators,
      fPreviewIndicatorAxis: fPreviewIndicatorAxis,
      unSelectPointColor: unSelectPointColor,
      selectPointColor: selectPointColor,
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => child,
    );
  }
}

class _VxPreview extends StatefulWidget {
  final int itemCount;
  final Widget Function(int index) itemBuilder;
  final Axis scrollDirection;
  final int defaultIndex;
  final bool loop;
  final int speed;
  final Curve curve;
  final Function(int index)? onChanged;
  final bool indicators;
  final VxPreviewIndicatorAxis fPreviewIndicatorAxis;
  final Color unSelectPointColor;
  final Color selectPointColor;

  const _VxPreview(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.scrollDirection = Axis.horizontal,
      this.defaultIndex = 0,
      this.loop = true,
      this.indicators = true,
      this.speed = 280,
      this.curve = Curves.bounceIn,
      this.unSelectPointColor = Colors.white,
      this.selectPointColor = Colors.red,
      this.fPreviewIndicatorAxis = VxPreviewIndicatorAxis.horizontal,
      this.onChanged})
      : assert(itemCount >= 1),
        assert(defaultIndex >= 0);

  @override
  _VxPreviewState createState() => _VxPreviewState();
}

class _VxPreviewState extends State<_VxPreview> {
  PageController? _pageController;
  int? position;
  int? itemCount;
  double? pointSize;
  double? pointPaddingSpace;

  @override
  void initState() {
    super.initState();
    itemCount = widget.loop ? widget.itemCount + 2 : widget.itemCount;
    position = widget.defaultIndex;
    pointPaddingSpace = 4;
    pointSize = 5;
    _pageController = PageController(initialPage: position!);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    children.add(_pageView());
    if (widget.indicators) {
      children.add(Positioned(
        bottom: 20,
        child: _indicatorView(),
      ));
    }
    return Stack(alignment: Alignment.center, children: children);
  }

  Widget _pageView() {
    final Widget child = PageView.builder(
      controller: _pageController,
      scrollDirection: widget.scrollDirection,
      itemBuilder: _itemBuilder,
      onPageChanged: _onPageChanged,
      itemCount: itemCount,
    );

    return Container(child: child);
  }

  Widget _indicatorView() {
    final List<Widget> children = [];

    Widget child;
    double pointPaddingHorizontal = 0;
    double pointPaddingVertical = 0;
    double paddingHorizontal;
    double paddingVertical;
    if (widget.fPreviewIndicatorAxis == VxPreviewIndicatorAxis.horizontal) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
      paddingHorizontal = pointPaddingSpace! * 2;
      paddingVertical = pointPaddingSpace!;
      pointPaddingHorizontal = pointPaddingSpace!;
    } else {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
      paddingHorizontal = pointPaddingSpace!;
      paddingVertical = pointPaddingSpace! * 2;
      pointPaddingVertical = pointPaddingSpace!;
    }

    List.generate(widget.itemCount, (index) {
      children.add(Padding(
        padding: EdgeInsets.symmetric(
          horizontal: pointPaddingHorizontal,
          vertical: pointPaddingVertical,
        ),
        child: VxRound(
          type: VxRoundType.point,
          size: pointSize,
          color: index == position! % widget.itemCount
              ? widget.selectPointColor
              : widget.unSelectPointColor,
        ),
      ));
    });

    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            pointSize! + pointPaddingSpace! * 2,
          ),
        ),
        color: Colors.black12,
      ),
      child: child,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (widget.loop) {
      return widget.itemBuilder(index % widget.itemCount);
    } else {
      return widget.itemBuilder(index);
    }
  }

  void _onPageChanged(int index) {
    if (index != position) {
      _callBackOnChange(index % widget.itemCount);
    }
    if (widget.loop) {
      if (index == 0) {
        position = widget.itemCount;
        Timer(const Duration(milliseconds: 300), () {
          _pageController!.jumpToPage(position!);
        });
      } else if (index == widget.itemCount + 1) {
        position = 1;
        Timer(const Duration(milliseconds: 300), () {
          _pageController!.jumpToPage(position!);
        });
      } else {
        position = index;
      }
    } else {
      position = index;
    }
    setState(() {});
  }

  void setIndex(int index) {
    _pageController!.animateToPage(
      index,
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void previousPage() {
    _pageController!.previousPage(
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void nextPage() {
    _pageController!.nextPage(
      duration: Duration(milliseconds: widget.speed),
      curve: widget.curve,
    );
  }

  void _callBackOnChange(int number) {
    if (widget.onChanged != null) {
      widget.onChanged!(number);
    }
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
}
