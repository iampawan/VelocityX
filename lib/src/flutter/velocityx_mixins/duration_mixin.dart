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

mixin VxDurationMixin<T> {
  T _child;

  @protected
  Duration velocityDuration;

  @protected
  void setChildForDuration(T child) {
    _child = child;
  }

  T seconds({@required int sec}) {
    assert(sec != null);
    velocityDuration = Duration(seconds: sec);
    return _child;
  }

  T milliSeconds({@required int milliSec}) {
    assert(milliSec != null);
    velocityDuration = Duration(milliseconds: milliSec);
    return _child;
  }

  T microSeconds({@required int microSec}) {
    assert(microSec != null);
    velocityDuration = Duration(microseconds: microSec);
    return _child;
  }

  T minutes({@required int mins}) {
    assert(mins != null);
    velocityDuration = Duration(minutes: mins);
    return _child;
  }

  T hours({@required int hours}) {
    assert(hours != null);
    velocityDuration = Duration(hours: hours);
    return _child;
  }

  T days({@required int days}) {
    assert(hours != null);
    velocityDuration = Duration(days: days);
    return _child;
  }
}
