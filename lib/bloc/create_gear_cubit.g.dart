// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_gear_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGearStateCWProxy {
  CreateGearState gear(PhotoGear gear);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGearState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGearState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGearState call({
    PhotoGear? gear,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateGearState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateGearState.copyWith.fieldName(...)`
class _$CreateGearStateCWProxyImpl implements _$CreateGearStateCWProxy {
  final CreateGearState _value;

  const _$CreateGearStateCWProxyImpl(this._value);

  @override
  CreateGearState gear(PhotoGear gear) => this(gear: gear);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGearState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGearState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGearState call({
    Object? gear = const $CopyWithPlaceholder(),
  }) {
    return CreateGearState(
      gear: gear == const $CopyWithPlaceholder() || gear == null
          ? _value.gear
          // ignore: cast_nullable_to_non_nullable
          : gear as PhotoGear,
    );
  }
}

extension $CreateGearStateCopyWith on CreateGearState {
  /// Returns a callable class that can be used as follows: `instanceOfCreateGearState.copyWith(...)` or like so:`instanceOfCreateGearState.copyWith.fieldName(...)`.
  _$CreateGearStateCWProxy get copyWith => _$CreateGearStateCWProxyImpl(this);
}
