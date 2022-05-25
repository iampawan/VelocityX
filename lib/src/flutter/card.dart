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
import 'package:velocity_x/velocity_x.dart';

import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';
import 'velocityx_mixins/padding_mixin.dart';
import 'velocityx_mixins/round_mixin.dart';

/// A material design card: a panel with slightly rounded corners and an
/// elevation shadow.
///
/// A card is a sheet of [Material] used to represent some related information,
/// for example an album, a geographical location, a meal, contact details, etc.
///
/// This is what it looks like when run:
///
/// ![A card with a slight shadow, consisting of two rows, one with an icon and
/// some text describing a musical, and the other with buttons for buying
/// tickets or listening to the show.](https://flutter.github.io/assets-for-api-docs/assets/material/card.png)
///
class VxCard extends VxWidgetBuilder<Widget>
    with VxColorMixin<VxCard>, VxPaddingMixin<VxCard>, VxRoundMixin<VxCard> {
  /// Creates a material design card.
  ///
  VxCard(
    this._child,
  ) {
    setChildToColor(this);
    setChildToPad(this);
    setChildToRound(this);
  }
  final Widget _child;

  Color? _shadowColor;
  double _elevation = 1.0;
  ShapeBorder? _shape;
  Clip? _clip;
  bool? _borderOnForeground;

  /// The card's background color.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then [CardTheme.color] of [ThemeData.cardTheme]
  /// is used. If that's null then [ThemeData.cardColor] is used.
  VxCard color(Color val) => this..velocityColor = val;

  /// The color to paint the shadow below the card.
  ///
  /// If null then the ambient [CardTheme]'s shadowColor is used.
  /// If that's null too, then the overall theme's [ThemeData.shadowColor]
  /// (default black) is used.
  VxCard shadowColor(Color val) => this.._shadowColor = val;

  /// The card's background color by hex value.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then [CardTheme.color] of [ThemeData.cardTheme]
  /// is used. If that's null then [ThemeData.cardColor] is used.
  VxCard hexColor(String colorHex) =>
      this..velocityColor = Vx.hexToColor(colorHex);

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defines the card's [Material.elevation].
  ///
  /// If this property is null then [CardTheme.elevation] of
  /// [ThemeData.cardTheme] is used. If that's null, the default value is 1.0.
  VxCard elevation(double val) => this.._elevation = val;

  /// {@macro flutter.widgets.Clip}
  ///
  /// If this property is null then [CardTheme.clipBehavior] of
  /// [ThemeData.cardTheme] is used. If that's null then the behavior will be [Clip.none].
  VxCard clip(Clip clip) => this.._clip = clip;

  ///
  /// If the card is a circular border card.
  ///
  VxCard get circular => this.._shape = const CircleBorder();

  ///
  /// If the card is a circular border card with zero elevation.
  ///
  VxCard get zeroCircular => this
    .._shape = const CircleBorder()
    .._elevation = 0.0;

  ///
  /// If the card having zero elevation.
  ///
  VxCard get zero => this.._elevation = 0.0;

  /// The shape of the card's [Material].
  ///
  /// Defines the card's [Material.shape].
  ///
  /// If this property is null then [CardTheme.shape] of [ThemeData.cardTheme]
  /// is used. If that's null then the shape will be a [RoundedRectangleBorder]
  /// with a circular corner radius of 4.0.
  VxCard shape(ShapeBorder shape) => this.._shape = shape;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// Use this to make it false, the border will be painted behind the [child].
  VxCard get disableBorderOnForeground => this.._borderOnForeground = false;

  @override
  Widget make({Key? key}) {
    return Card(
      key: key,
      margin: velocityPadding,
      child: _child,
      color: velocityColor,
      clipBehavior: _clip ?? Clip.antiAlias,
      borderOnForeground: _borderOnForeground ?? true,
      elevation: _elevation,
      shape: (roundedValue != null)
          ? RoundedRectangleBorder(
              borderRadius:
                  radiusGeometry ?? BorderRadius.circular(roundedValue!))
          : _shape,
      shadowColor: _shadowColor,
    );
  }
}

extension VxCardExtension on Widget {
  ///
  /// Extension method to directly access [VxCard] with any widget without wrapping or with dot operator.
  ///
  VxCard get card => VxCard(this);
}
