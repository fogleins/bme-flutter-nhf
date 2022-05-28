// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_details_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CameraLoadedCWProxy {
  CameraLoaded camera(Camera camera);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CameraLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CameraLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  CameraLoaded call({
    Camera? camera,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCameraLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCameraLoaded.copyWith.fieldName(...)`
class _$CameraLoadedCWProxyImpl implements _$CameraLoadedCWProxy {
  final CameraLoaded _value;

  const _$CameraLoadedCWProxyImpl(this._value);

  @override
  CameraLoaded camera(Camera camera) => this(camera: camera);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CameraLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CameraLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  CameraLoaded call({
    Object? camera = const $CopyWithPlaceholder(),
  }) {
    return CameraLoaded(
      camera: camera == const $CopyWithPlaceholder() || camera == null
          ? _value.camera
          // ignore: cast_nullable_to_non_nullable
          : camera as Camera,
    );
  }
}

extension $CameraLoadedCopyWith on CameraLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfCameraLoaded.copyWith(...)` or like so:`instanceOfCameraLoaded.copyWith.fieldName(...)`.
  _$CameraLoadedCWProxy get copyWith => _$CameraLoadedCWProxyImpl(this);
}
