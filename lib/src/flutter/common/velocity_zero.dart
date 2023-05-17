/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.o
 */

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

///
/// [myBoxDesc] to reuse with [PKSkeleton]
///
Decoration myBoxDec(animation, {isCircle = false, isDark = false}) {
  return BoxDecoration(
    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: isDark
          ? [
              Colors.grey[700]!,
              Colors.grey[600]!,
              Colors.grey[700]!,
              // Color(0xfff6f7f9),
            ]
          : [
              const Color(0xfff6f7f9),
              const Color(0xffe9ebee),
              const Color(0xfff6f7f9),
            ],
      stops: [
        animation.value - 1,
        animation.value,
        animation.value + 1,
      ],
    ),
  );
}

///
/// [VxZeroCard] can be used to provide a single loading card with PKSkeleton cool animation.
///
class VxZeroCard extends StatefulWidget {
  const VxZeroCard(
      {super.key,
      this.isCircularImage = true,
      this.isBottomLinesActive = true,
      this.isDark = false});

  /// if the image should be circular? By default it is true
  final bool isCircularImage;

  /// if the bottom lines are visible or not.
  final bool isBottomLinesActive;

  /// if dark theme is enabled or not. Disabled by default.
  final bool isDark;

  @override
  VxZeroCardState createState() => VxZeroCardState();
}

class VxZeroCardState extends State<VxZeroCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: -1.0, end: 2.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine, parent: _controller));

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: context.percentHeight * 10,
                      width: context.percentWidth * 10,
                      decoration: myBoxDec(animation,
                          isCircle: widget.isCircularImage,
                          isDark: widget.isDark),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: context.percentWidth * 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _VxLine(20, 0.8, animation, widget.isDark),
                          _VxLine(15, 0.7, animation, widget.isDark),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: context.percentWidth * 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _VxLine(15, 0.8, animation, widget.isDark),
                          _VxLine(15, 0.7, animation, widget.isDark),
                        ],
                      ),
                    ),
                  ],
                ),
                if (widget.isBottomLinesActive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      _VxLine(70, 0.7, animation, widget.isDark),
                      const SizedBox(
                        height: 10,
                      ),
                      _VxLine(80, 0.7, animation, widget.isDark),
                      const SizedBox(
                        height: 10,
                      ),
                      _VxLine(50, 0.7, animation, widget.isDark),
                    ],
                  )
                else
                  const Offstage()
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VxLine extends StatelessWidget {
  const _VxLine(this.widthRatio, this.heightRatio, this.animation, this.isDark);

  final Animation<double>? animation;
  final double widthRatio;
  final double heightRatio;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * heightRatio,
      width: context.percentWidth * widthRatio,
      decoration: myBoxDec(animation, isDark: isDark),
    );
  }
}

///
/// [VxZeroList] can be used to provide a list of loading cards with PKSkeleton cool animation.
///
class VxZeroList extends StatelessWidget {
  const VxZeroList(
      {super.key,
      this.isCircularImage = true,
      this.length = 10,
      this.isBottomLinesActive = true,
      this.isDark = false});

  /// if the image should be circular? By default it is true
  final bool isCircularImage;

  /// if the bottom lines are visible or not.
  final bool isBottomLinesActive;

  /// if dark theme is enabled or not. Disabled by default.
  final bool isDark;

  /// Specify the length of the list. By default it is 10.
  final int length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: key,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return VxZeroCard(
          isCircularImage: isCircularImage,
          isBottomLinesActive: isBottomLinesActive,
          isDark: isDark,
        );
      },
    );
  }
}
