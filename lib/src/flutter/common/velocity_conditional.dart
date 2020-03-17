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

/// Runs a [WidgetBuilder]'s result if the [condition] is true.
///
/// When [condition] is true the [builder] is run. If false
/// and [fallback] is not null, [fallback] is run. If [fallback] is null and
/// [condition] is false, an empty [Container] is rendered.
///
/// Example:
///
/// ```dart
/// VelocityConditional(
///  condition: true,
/// builder: (context) {
///    return Text('This gets rendered');
///  },
/// )
///
/// VelocityConditional(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, an empty offstage will be rendered');
///  },
/// )
///
/// VelocityConditional(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, as fallback is not null, it is used to render the fallback widget.');
///  },
///  fallback: (context) {
///    return Text('This gets rendered');
///  }
/// )
/// ```

class VelocityConditional extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool condition;

  /// Run if [condition] is true.
  final WidgetBuilder builder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder fallback;

  const VelocityConditional({
    Key key,
    @required this.condition,
    @required this.builder,
    this.fallback,
  })  : assert(condition != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      condition ? builder(context) : fallback != null ? fallback(context) : const Offstage();
}
