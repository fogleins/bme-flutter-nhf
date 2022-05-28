// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_create_or_edit_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateOrEditCameraStateCWProxy {
  CreateOrEditCameraState camera(Camera camera);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrEditCameraState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrEditCameraState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrEditCameraState call({
    Camera? camera,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateOrEditCameraState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateOrEditCameraState.copyWith.fieldName(...)`
class _$CreateOrEditCameraStateCWProxyImpl
    implements _$CreateOrEditCameraStateCWProxy {
  final CreateOrEditCameraState _value;

  const _$CreateOrEditCameraStateCWProxyImpl(this._value);

  @override
  CreateOrEditCameraState camera(Camera camera) => this(camera: camera);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrEditCameraState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrEditCameraState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrEditCameraState call({
    Object? camera = const $CopyWithPlaceholder(),
  }) {
    return CreateOrEditCameraState(
      camera: camera == const $CopyWithPlaceholder() || camera == null
          ? _value.camera
          // ignore: cast_nullable_to_non_nullable
          : camera as Camera,
    );
  }
}

extension $CreateOrEditCameraStateCopyWith on CreateOrEditCameraState {
  /// Returns a callable class that can be used as follows: `instanceOfCreateOrEditCameraState.copyWith(...)` or like so:`instanceOfCreateOrEditCameraState.copyWith.fieldName(...)`.
  _$CreateOrEditCameraStateCWProxy get copyWith =>
      _$CreateOrEditCameraStateCWProxyImpl(this);
}
