import 'dart:math';

import 'package:flutter/material.dart';

/// A class that can be queried for breakpoints based on the guidelines in
/// https://material.io/guidelines/layout/responsive-ui.html .
class MaterialResponsiveUiData {
  static MaterialResponsiveUiData of(BuildContext context) =>
      MaterialResponsiveUiData._(MediaQuery.of(context));

  final MediaQueryData _data;

  MaterialResponsiveUiData._(this._data);

  /// Returns the [MobileDeviceInfo] (type and symbolic size) for the device.
  MobileDeviceInfo get deviceInfo => MobileDeviceInfo(_data);

  /// Returns the symbolic window size of the device.
  VxWindowSize get windowSize {
    if (_width < 600.0) {
      return VxWindowSize.xsmall;
    }

    if (_width < 1024.0) {
      return VxWindowSize.small;
    }
    if (_width < 1440.0) {
      return VxWindowSize.medium;
    }

    if (_width < 1920.0) {
      return VxWindowSize.large;
    }

    return VxWindowSize.xlarge;
  }

  /// Returns the recommended number of grid layout columns.
  int get columns {
    if (_width < 600.0) {
      return 4;
    }

    if (_width < 840.0) {
      return 8;
    }

    return 12;
  }

  /// Returns the recommended gutter width, in logical pixels.
  double get gutter {
    if (_minDimension < 600.0) {
      return _width < 960.0 ? 16.0 : 24.0;
    } else {
      return _width < 600.0 ? 16.0 : 24.0;
    }
  }

  double get _width => _data.size.width;

  double get _minDimension => min(_width, _data.size.height);
}

/// Types of mobile devices.
///
/// Note that this is based exclusively on the dimensions of the device and
/// not on the presence of a phone.
enum MobileDeviceType { handset, tablet }

/// Symbolic sizes of mobile devices.
///
/// Note that the ranges are different depending on the [MobileDeviceType] of
/// the device. Note also that only handsets can be [medium].
enum MobileDeviceSize { small, medium, large }

/// Combines [MobileDeviceType] and [MobileDeviceSize].
abstract class MobileDeviceInfo {
  final double _width;

  factory MobileDeviceInfo(MediaQueryData data) =>
      data.orientation == Orientation.portrait
          ? _PortraitDeviceInfo(data.size.width)
          : _LandscapeDeviceInfo(data.size.width);

  MobileDeviceInfo._(this._width);

  /// Determines whether the device is a handset or tablet.
  ///
  /// Note that for some devices the device type may change depending
  /// on its orientation.
  MobileDeviceType get deviceType;

  /// Determines the symbolic size of a device.
  ///
  /// Note that for some devices the device size may change depending
  /// on its orientation.
  MobileDeviceSize get deviceSize;
}

class _PortraitDeviceInfo extends MobileDeviceInfo {
  _PortraitDeviceInfo(super.width) : super._();

  @override
  MobileDeviceType get deviceType =>
      _width < 600.0 ? MobileDeviceType.handset : MobileDeviceType.tablet;

  @override
  MobileDeviceSize get deviceSize {
    // handsets
    if (_width < 360.0) {
      return MobileDeviceSize.small;
    }

    if (_width < 400.0) {
      return MobileDeviceSize.medium;
    }

    if (_width < 600.0) {
      return MobileDeviceSize.large;
    }
    // tablets
    if (_width < 720.0) {
      return MobileDeviceSize.small;
    }

    return MobileDeviceSize.large;
  }
}

class _LandscapeDeviceInfo extends MobileDeviceInfo {
  _LandscapeDeviceInfo(super.width) : super._();

  @override
  MobileDeviceType get deviceType =>
      _width < 960.0 ? MobileDeviceType.handset : MobileDeviceType.tablet;

  @override
  MobileDeviceSize get deviceSize {
    // handsets
    if (_width < 600.0) {
      return MobileDeviceSize.small;
    }

    if (_width < 720.0) {
      return MobileDeviceSize.medium;
    }

    if (_width < 960.0) {
      return MobileDeviceSize.large;
    }
    // tablets
    if (_width < 1024.0) {
      return MobileDeviceSize.small;
    }

    return MobileDeviceSize.large;
  }
}

/// Symbolic window sizes of mobile devices.
enum VxWindowSize { xsmall, small, medium, large, xlarge }
