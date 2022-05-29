import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';

part 'photo_gear_base.g.dart';

@immutable
@CopyWith()
class PhotoGear {
  final int? id;
  final String make;
  final String model;
  final String serialNumber;
  final int value;
  final String valueCurrency;
  final String note;
  final PhotoGearType type;
  final String properties;

  const PhotoGear(
      {this.id,
      required this.make,
      required this.model,
      required this.serialNumber,
      required this.value,
      required this.valueCurrency,
      required this.note,
      required this.type,
      required this.properties});
}

enum PhotoGearType { gearCamera, gearLens }
