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
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension TextExtensions on Text {
  /// Colors

  Text textWhite({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.white);
  Text textBlack({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.black);

  Text textGray100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray100);
  Text textGray200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray200);
  Text textGray300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray300);
  Text textGray400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray400);
  Text textGray500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray500);
  Text textGray600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray600);
  Text textGray700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray700);
  Text textGray800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray800);
  Text textGray900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.gray900);

  Text textRed100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red100);
  Text textRed200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red200);
  Text textRed300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red300);
  Text textRed400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red400);
  Text textRed500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red500);
  Text textRed600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red600);
  Text textRed700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red700);
  Text textRed800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red800);
  Text textRed900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.red900);

  Text textOrange100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange100);
  Text textOrange200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange200);
  Text textOrange300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange300);
  Text textOrange400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange400);
  Text textOrange500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange500);
  Text textOrange600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange600);
  Text textOrange700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange700);
  Text textOrange800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange800);
  Text textOrange900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.orange900);

  Text textYellow100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow100);
  Text textYellow200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow200);
  Text textYellow300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow300);
  Text textYellow400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow400);
  Text textYellow500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow500);
  Text textYellow600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow600);
  Text textYellow700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow700);
  Text textYellow800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow800);
  Text textYellow900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.yellow900);

  Text textGreen100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green100);
  Text textGreen200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green200);
  Text textGreen300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green300);
  Text textGreen400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green400);
  Text textGreen500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green500);
  Text textGreen600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green600);
  Text textGreen700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green700);
  Text textGreen800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green800);
  Text textGreen900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.green900);

  Text textTeal100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal100);
  Text textTeal200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal200);
  Text textTeal300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal300);
  Text textTeal400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal400);
  Text textTeal500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal500);
  Text textTeal600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal600);
  Text textTeal700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal700);
  Text textTeal800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal800);
  Text textTeal900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.teal900);

  Text textBlue100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue100);
  Text textBlue200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue200);
  Text textBlue300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue300);
  Text textBlue400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue400);
  Text textBlue500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue500);
  Text textBlue600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue600);
  Text textBlue700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue700);
  Text textBlue800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue800);
  Text textBlue900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.blue900);

  Text textIndigo100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo100);
  Text textIndigo200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo200);
  Text textIndigo300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo300);
  Text textIndigo400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo400);
  Text textIndigo500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo500);
  Text textIndigo600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo600);
  Text textIndigo700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo700);
  Text textIndigo800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo800);
  Text textIndigo900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.indigo900);

  Text textPurple100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple100);
  Text textPurple200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple200);
  Text textPurple300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple300);
  Text textPurple400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple400);
  Text textPurple500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple500);
  Text textPurple600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple600);
  Text textPurple700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple700);
  Text textPurple800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple800);
  Text textPurple900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.purple900);

  Text textPink100({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink100);
  Text textPink200({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink200);
  Text textPink300({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink300);
  Text textPink400({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink400);
  Text textPink500({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink500);
  Text textPink600({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink600);
  Text textPink700({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink700);
  Text textPink800({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink800);
  Text textPink900({Key key}) =>
      _coloredText(key: key, child: this, color: VelocityX.pink900);

  Text _coloredText({Key key, @required String color, @required Text child}) {
    return Text(
      child.data,
      key: key,
      style: child.style != null
          ? child.style.apply(color: VelocityX.hexToColor(color))
          : TextStyle(color: VelocityX.hexToColor(color)),
      locale: child?.locale,
      maxLines: child?.maxLines,
      overflow: child?.overflow,
      semanticsLabel: child?.semanticsLabel,
      softWrap: child?.softWrap,
      strutStyle: child?.strutStyle,
      textAlign: child?.textAlign,
      textDirection: child?.textDirection,
      textHeightBehavior: child?.textHeightBehavior,
      textScaleFactor: child?.textScaleFactor,
      textWidthBasis: child?.textWidthBasis,
    );
  }
}
