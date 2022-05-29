// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_gear_base.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoGearCWProxy {
  PhotoGear id(int? id);

  PhotoGear make(String make);

  PhotoGear model(String model);

  PhotoGear note(String note);

  PhotoGear properties(String properties);

  PhotoGear serialNumber(String serialNumber);

  PhotoGear type(PhotoGearType type);

  PhotoGear value(int value);

  PhotoGear valueCurrency(String valueCurrency);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoGear(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoGear(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoGear call({
    int? id,
    String? make,
    String? model,
    String? note,
    String? properties,
    String? serialNumber,
    PhotoGearType? type,
    int? value,
    String? valueCurrency,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoGear.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoGear.copyWith.fieldName(...)`
class _$PhotoGearCWProxyImpl implements _$PhotoGearCWProxy {
  final PhotoGear _value;

  const _$PhotoGearCWProxyImpl(this._value);

  @override
  PhotoGear id(int? id) => this(id: id);

  @override
  PhotoGear make(String make) => this(make: make);

  @override
  PhotoGear model(String model) => this(model: model);

  @override
  PhotoGear note(String note) => this(note: note);

  @override
  PhotoGear properties(String properties) => this(properties: properties);

  @override
  PhotoGear serialNumber(String serialNumber) =>
      this(serialNumber: serialNumber);

  @override
  PhotoGear type(PhotoGearType type) => this(type: type);

  @override
  PhotoGear value(int value) => this(value: value);

  @override
  PhotoGear valueCurrency(String valueCurrency) =>
      this(valueCurrency: valueCurrency);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoGear(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoGear(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoGear call({
    Object? id = const $CopyWithPlaceholder(),
    Object? make = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? serialNumber = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? valueCurrency = const $CopyWithPlaceholder(),
  }) {
    return PhotoGear(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      make: make == const $CopyWithPlaceholder() || make == null
          ? _value.make
          // ignore: cast_nullable_to_non_nullable
          : make as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      note: note == const $CopyWithPlaceholder() || note == null
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String,
      properties:
          properties == const $CopyWithPlaceholder() || properties == null
              ? _value.properties
              // ignore: cast_nullable_to_non_nullable
              : properties as String,
      serialNumber:
          serialNumber == const $CopyWithPlaceholder() || serialNumber == null
              ? _value.serialNumber
              // ignore: cast_nullable_to_non_nullable
              : serialNumber as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PhotoGearType,
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

extension $PhotoGearCopyWith on PhotoGear {
  /// Returns a callable class that can be used as follows: `instanceOfPhotoGear.copyWith(...)` or like so:`instanceOfPhotoGear.copyWith.fieldName(...)`.
  _$PhotoGearCWProxy get copyWith => _$PhotoGearCWProxyImpl(this);
}
