// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CameraCWProxy {
  Camera id(int? id);

  Camera make(dynamic make);

  Camera model(String model);

  Camera note(String note);

  Camera resolution(double resolution);

  Camera sensorSize(SensorSize sensorSize);

  Camera serialNumber(String serialNumber);

  Camera shutterCount(int shutterCount);

  Camera value(int value);

  Camera valueCurrency(String valueCurrency);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Camera(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Camera(...).copyWith(id: 12, name: "My name")
  /// ````
  Camera call({
    int? id,
    dynamic? make,
    String? model,
    String? note,
    double? resolution,
    SensorSize? sensorSize,
    String? serialNumber,
    int? shutterCount,
    int? value,
    String? valueCurrency,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCamera.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCamera.copyWith.fieldName(...)`
class _$CameraCWProxyImpl implements _$CameraCWProxy {
  final Camera _value;

  const _$CameraCWProxyImpl(this._value);

  @override
  Camera id(int? id) => this(id: id);

  @override
  Camera make(dynamic make) => this(make: make);

  @override
  Camera model(String model) => this(model: model);

  @override
  Camera note(String note) => this(note: note);

  @override
  Camera resolution(double resolution) => this(resolution: resolution);

  @override
  Camera sensorSize(SensorSize sensorSize) => this(sensorSize: sensorSize);

  @override
  Camera serialNumber(String serialNumber) => this(serialNumber: serialNumber);

  @override
  Camera shutterCount(int shutterCount) => this(shutterCount: shutterCount);

  @override
  Camera value(int value) => this(value: value);

  @override
  Camera valueCurrency(String valueCurrency) =>
      this(valueCurrency: valueCurrency);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Camera(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Camera(...).copyWith(id: 12, name: "My name")
  /// ````
  Camera call({
    Object? id = const $CopyWithPlaceholder(),
    Object? make = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? resolution = const $CopyWithPlaceholder(),
    Object? sensorSize = const $CopyWithPlaceholder(),
    Object? serialNumber = const $CopyWithPlaceholder(),
    Object? shutterCount = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? valueCurrency = const $CopyWithPlaceholder(),
  }) {
    return Camera(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      make: make == const $CopyWithPlaceholder() || make == null
          ? _value.make
          // ignore: cast_nullable_to_non_nullable
          : make as dynamic,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      note: note == const $CopyWithPlaceholder() || note == null
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String,
      resolution:
          resolution == const $CopyWithPlaceholder() || resolution == null
              ? _value.resolution
              // ignore: cast_nullable_to_non_nullable
              : resolution as double,
      sensorSize:
          sensorSize == const $CopyWithPlaceholder() || sensorSize == null
              ? _value.sensorSize
              // ignore: cast_nullable_to_non_nullable
              : sensorSize as SensorSize,
      serialNumber:
          serialNumber == const $CopyWithPlaceholder() || serialNumber == null
              ? _value.serialNumber
              // ignore: cast_nullable_to_non_nullable
              : serialNumber as String,
      shutterCount:
          shutterCount == const $CopyWithPlaceholder() || shutterCount == null
              ? _value.shutterCount
              // ignore: cast_nullable_to_non_nullable
              : shutterCount as int,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int,
      valueCurrency:
          valueCurrency == const $CopyWithPlaceholder() || valueCurrency == null
              ? _value.valueCurrency
              // ignore: cast_nullable_to_non_nullable
              : valueCurrency as String,
    );
  }
}

extension $CameraCopyWith on Camera {
  /// Returns a callable class that can be used as follows: `instanceOfCamera.copyWith(...)` or like so:`instanceOfCamera.copyWith.fieldName(...)`.
  _$CameraCWProxy get copyWith => _$CameraCWProxyImpl(this);
}
