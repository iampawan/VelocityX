/*
 * Copyright 2023 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';

/// A widget that displays a statistic with an icon.
class VxStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color labelColor;
  final Color valueColor;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const VxStat({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor = Colors.black,
    this.labelColor = Colors.black,
    this.valueColor = Colors.black,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: labelStyle?.merge(TextStyle(color: labelColor)) ??
                  TextStyle(color: labelColor),
            ),
            Text(
              value,
              style: valueStyle?.merge(TextStyle(color: valueColor)) ??
                  TextStyle(color: valueColor),
            ),
          ],
        ),
      ],
    );
  }
}
