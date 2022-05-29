// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GearLoadedCWProxy {
  GearLoaded gear(List<PhotoGear> gear);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GearLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GearLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  GearLoaded call({
    List<PhotoGear>? gear,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGearLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGearLoaded.copyWith.fieldName(...)`
class _$GearLoadedCWProxyImpl implements _$GearLoadedCWProxy {
  final GearLoaded _value;

  const _$GearLoadedCWProxyImpl(this._value);

  @override
  GearLoaded gear(List<PhotoGear> gear) => this(gear: gear);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GearLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GearLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  GearLoaded call({
    Object? gear = const $CopyWithPlaceholder(),
  }) {
    return GearLoaded(
      gear: gear == const $CopyWithPlaceholder() || gear == null
          ? _value.gear
          // ignore: cast_nullable_to_non_nullable
          : gear as List<PhotoGear>,
    );
  }
}

extension $GearLoadedCopyWith on GearLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfGearLoaded.copyWith(...)` or like so:`instanceOfGearLoaded.copyWith.fieldName(...)`.
  _$GearLoadedCWProxy get copyWith => _$GearLoadedCWProxyImpl(this);
}
