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

mixin VxShadowMixin<T> {
  late T _child;

  @protected
  List<BoxShadow>? velocityShadow;

  @protected
  void setChildForShadow(T child) {
    _child = child;
  }

  /// Shadowing
  T get outerShadowSm => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.05))
      ]);

  T get outerShadow => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 0,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 0,
          color: Color.fromRGBO(0, 0, 0, 0.06),
        )
      ]);

  T get outerShadowMd => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        const BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -1,
          color: Color.fromRGBO(0, 0, 0, 0.06),
        )
      ]);

  T get outerShadowLg => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 15,
          spreadRadius: -3,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        const BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -2,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]);

  T get outerShadowXl => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 20),
          blurRadius: 25,
          spreadRadius: -5,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        const BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 10,
          spreadRadius: -5,
          color: Color.fromRGBO(0, 0, 0, 0.04),
        )
      ]);

  T get outerShadow2Xl => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 25),
          blurRadius: 50,
          spreadRadius: -12,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ]);

  T get outerShadow3Xl => _addShadow(shadows: <BoxShadow>[
        const BoxShadow(
          offset: Offset(0, 35),
          blurRadius: 60,
          spreadRadius: -15,
          color: Color.fromRGBO(0, 0, 0, 0.3),
        ),
      ]);

  /// Shadowing
  T get noneShadow => _addShadow(shadows: kElevationToShadow[0]);

  /// Shadowing
  T get shadow => _addShadow(shadows: kElevationToShadow[6]);

  ///
  /// To give extra small shadow.
  ///
  T get shadowXs => _addShadow(shadows: kElevationToShadow[1]);

  ///
  /// To give small shadow.
  ///
  T get shadowSm => _addShadow(shadows: kElevationToShadow[2]);

  ///
  /// To give medium shadow.
  ///
  T get shadowMd => _addShadow(shadows: kElevationToShadow[3]);

  ///
  /// To give large shadow.
  ///
  T get shadowLg => _addShadow(shadows: kElevationToShadow[4]);

  ///
  /// To give extra large shadow.
  ///
  T get shadowXl => _addShadow(shadows: kElevationToShadow[6]);

  ///
  /// To give twice extra large shadow.
  ///
  T get shadow2xl => _addShadow(shadows: kElevationToShadow[8]);

  ///
  /// To give thrice extra large shadow.
  ///
  T get shadow3xl => _addShadow(shadows: kElevationToShadow[9]);

  ///
  /// To give 4x extra large shadow.
  ///
  T get shadow4xl => _addShadow(shadows: kElevationToShadow[12]);

  ///
  /// To give 5x extra large shadow.
  ///
  T get shadow5xl => _addShadow(shadows: kElevationToShadow[16]);

  ///
  /// To give max shadow.
  ///
  T get shadowMax => _addShadow(shadows: kElevationToShadow[24]);

  T _addShadow({required List<BoxShadow>? shadows}) {
    velocityShadow = shadows;
    return _child;
  }
}
