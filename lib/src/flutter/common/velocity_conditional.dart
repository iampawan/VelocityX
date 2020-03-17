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
import 'package:velocity_x/src/velocity_x_extensions.dart';
import 'package:velocity_x/velocity_x.dart';

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
  Widget build(BuildContext context) => condition ? builder(context) : fallback != null ? fallback(context) : const Offstage();
}

/// Renders widgets based on switch case conditions

/// Example:
///
/// ```dart
///  VelocityConditionalSwitch.single<String>(
///         context: context,
///         valueBuilder: (BuildContext context) => mynumber,
///         caseBuilders: {
///           'One': (BuildContext context) => Text('The value is One'),
///          'Two': (BuildContext context) => Text('The value is Two'),
///       },
///         fallbackBuilder: (BuildContext context) => Text('None of the cases matched!'),
///      ),
/// ```
class VelocityConditionalSwitch {
  VelocityConditionalSwitch._();

  /// A function which returns a single `Widget`
  ///
  /// - [valueBuilder] is a function which returns a value.
  /// - [caseBuilders] is a `Map` of value to `Widget` builders,
  /// when one of the keys matches the value returns by [valueBuilder],
  /// the corresponding `Widget` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `Widget`,
  ///  it is used when none of the keys in [caseBuilders]matches
  /// the value returns by [valueBuilder].
  static Widget single<T>({
    @required BuildContext context,
    @required T Function(BuildContext context) valueBuilder,
    @required Map<T, Widget Function(BuildContext context)> caseBuilders,
    @required Widget Function(BuildContext context) fallbackBuilder,
  }) {
    final T value = valueBuilder(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value](context);
    } else {
      return fallbackBuilder(context);
    }
  }

  /// A function which returns a `List<Widget>`
  ///
  /// - [valueBuilder] is a function which returns a value.
  /// - [caseBuilders] is a `Map` of value to `List<Widget>` builders,
  /// when one of the keys matches the value returns by [valueBuilder],
  /// the corresponding `List<Widget>` builder will be used.
  /// - [fallbackBuilder] is a function which returns a `List<Widget>`,
  ///  it is used when none of the keys in [caseBuilders] matches
  /// the value returns by [valueBuilder].
  static List<Widget> list<T>({
    @required BuildContext context,
    @required T Function(BuildContext context) valueBuilder,
    @required Map<T, List<Widget> Function(BuildContext context)> caseBuilders,
    @required List<Widget> Function(BuildContext context) fallbackBuilder,
  }) {
    final T value = valueBuilder(context);
    if (caseBuilders[value] != null) {
      return caseBuilders[value](context);
    } else {
      return fallbackBuilder(context);
    }
  }
}

class VelocityDevice extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  const VelocityDevice({Key key, @required this.mobile, @required this.web})
      : assert(mobile != null),
        assert(web != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VelocityConditionalSwitch.single(
      context: context,
      valueBuilder: (context) => context.mdWindowSize,
      caseBuilders: {MobileWindowSize.xsmall: (context) => mobile},
      fallbackBuilder: (context) => web,
    );
  }
}
