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
import 'builder.dart';

/// Center the widget
extension CenterExtension on Widget {
  ///
  /// Extension method to directly access [Center] with any widget without wrapping or with dot operator.
  ///
  Widget centered({Key? key}) => Center(key: key, child: this);

  // _MyPaddingCallable get padding => _MyPaddingCallable(build());
}

extension VxCenterBuilderExtension on VxWidgetBuilder<Widget> {
  ///
  /// Extension method to directly access [Center] with any Vx widget without wrapping or with dot operator.
  ///
  Widget makeCentered({Key? key}) => Center(key: key, child: make());
}

// class _MyPaddingCallable {
//   _MyPaddingCallable(this.child);

//   final Widget child;

//   Padding call(EdgeInsets edgeInsets) {
//     return Padding(
//       padding: edgeInsets,
//       child: child,
//     );
//   }

//   Padding get all16 => Padding(padding: const EdgeInsets.all(16), child: child);
// }
