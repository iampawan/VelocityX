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

import 'package:flutter/material.dart';
import 'package:velocity_x/src/dart/timeline.dart';

import 'timeline_painter.dart';

/// To show a timeline view with filled dot and title, subtitle.

class VxTimelineView extends StatelessWidget {
  const VxTimelineView(
      {super.key,
      required this.lineColor,
      required this.backgroundColor,
      required this.trailingColor,
      required this.model,
      this.firstElement = false,
      this.lastElement = false,
      this.controller,
      this.headingColor,
      this.descriptionColor,
      this.hideLauncher = true,
      this.trailing});
  final Color lineColor;
  final Color backgroundColor;
  final Color trailingColor;
  final VxTimelineModel model;
  final bool firstElement;
  final bool lastElement;
  final Animation<double>? controller;
  final Color? headingColor;
  final Color? descriptionColor;
  final bool hideLauncher;
  final Widget? trailing;

  Widget _buildLine(BuildContext context, Widget? child) {
    return SizedBox(
      width: 40.0,
      child: CustomPaint(
        painter: VxTimelinePainter(
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            trailingColor: trailingColor,
            firstElement: firstElement,
            lastElement: lastElement,
            controller: controller!),
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: Text(
            model.heading.length > 47
                ? "${model.heading.substring(0, 47)}..."
                : model.heading,
            style: TextStyle(
              color: headingColor ?? Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.description.length > 50
                ? "${model.description.substring(0, 50)}..."
                : model
                    .description, // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
            style: TextStyle(
              color: descriptionColor ?? Colors.black,
            ),
            textScaler:  const TextScaler.linear(1.25),
          ),
        )
      ],
    );
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      height: 80.0,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedBuilder(
              builder: _buildLine,
              animation: controller!,
            ),
            Expanded(
              child: _buildContentColumn(context),
            ),
            if (!hideLauncher)
              if (trailing != null)
                trailing!
              else
                Icon(
                  Icons.open_in_new,
                  color: trailingColor,
                  size: 20,
                )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRow(context);
  }
}
