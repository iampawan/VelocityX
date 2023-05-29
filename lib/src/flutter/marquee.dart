/*
 * Copyright (c) 2020 Pawan Kumar. All rights reserved.
 *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  * http://www.apache.org/licenses/LICENSE-2.0
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 */

import 'dart:async';

import 'package:flutter/material.dart';

import '../extensions/context_ext.dart';

class VxMarquee extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Axis scrollAxis;
  final double ratioOfBlankToScreen;

  const VxMarquee({
    super.key,
    required this.text,
    this.textStyle,
    this.scrollAxis = Axis.horizontal,
    this.ratioOfBlankToScreen = 0.25,
  });

  @override
  VxMarqueeState createState() => VxMarqueeState();
}

class VxMarqueeState extends State<VxMarquee>
    with SingleTickerProviderStateMixin {
  ScrollController? scrollController;
  double? blankWidth;
  double? blankHeight;
  double position = 0.0;
  late Timer timer;
  final double _moveDistance = 3.0;
  int duration = 100;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    final double widgetWidth =
        _key.currentContext!.findRenderObject()!.paintBounds.size.width;
    final double widgetHeight =
        _key.currentContext!.findRenderObject()!.paintBounds.size.height;

    timer = Timer.periodic(
      Duration(milliseconds: duration),
      (timer) {
        final double maxScrollExtent =
            scrollController!.position.maxScrollExtent;
        final double pixels = scrollController!.position.pixels;
        //When the distance of animateTo is greater than the maximum sliding distance, return to the specific position of the first child so that the end is exactly on the right side, and then continue to roll, creating the illusion of marquee
        if (pixels + _moveDistance >= maxScrollExtent) {
          if (widget.scrollAxis == Axis.horizontal) {
            //maxScrollExtent is the maximum sliding distance, the non-slidable distance is not counted (that is, the width of the ListView control), maxScrollExtent + widgetWidth is the true width of the children
            //(maxScrollExtent+widgetWidth-blankWidth)/2 can calculate the length of a TextView control, and then subtract widgetWidth. Calculate the offset required for the first child to shift to the rightmost
            //When animateTo slides to the end, but there is still a distance from the end, this distance should be taken into account when jumpingTo pixels-maxScrollExtent
            //The original calculation formula (maxScrollExtent+widgetWidth-blankWidth)/2 -widgetWidth + pixels- maxScrollExtent, the following calculation formula is simplified
            position = (maxScrollExtent - blankWidth! - widgetWidth) / 2 +
                pixels -
                maxScrollExtent;
          } else {
            position = (maxScrollExtent - blankHeight! - widgetHeight) / 2 +
                pixels -
                maxScrollExtent;
          }
          scrollController!.jumpTo(position);
        }
        position += _moveDistance;
        scrollController!.animateTo(
          position,
          duration: Duration(milliseconds: duration),
          curve: Curves.linear,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    blankWidth = context.screenWidth * widget.ratioOfBlankToScreen;
    blankHeight = context.screenHeight * widget.ratioOfBlankToScreen;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      final String newString = widget.text.split("").join("\n");
      return Center(
        child: Text(
          newString,
          style: widget.textStyle,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
      child: Text(
        widget.text,
        style: widget.textStyle,
      ),
    );
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return Container(
        width: blankWidth,
      );
    } else {
      return Container(
        height: blankHeight,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _key,
      scrollDirection: widget.scrollAxis,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(),
        getCenterChild(),
        getBothEndsChild(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

extension VxMarqueeExtension on String {
  ///
  /// Extension method to directly access [VxMarquee] with any widget without wrapping or with dot operator.
  ///
  /// show [marquee] extension

  Widget marquee({
    TextStyle? textStyle,
    Axis scrollAxis = Axis.horizontal,
    double ratioOfBlankToScreen = 0.25,
  }) =>
      VxMarquee(
        text: this,
        textStyle: textStyle,
        scrollAxis: scrollAxis,
        ratioOfBlankToScreen: ratioOfBlankToScreen,
      );
}
