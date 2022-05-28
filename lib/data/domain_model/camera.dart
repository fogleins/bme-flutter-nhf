import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';
import 'package:flutter/foundation.dart';

part 'camera.g.dart';

enum SensorSize { apsC, fullFrame }

@immutable
@CopyWith()
class Camera extends PhotoGear {
  final SensorSize sensorSize;
  final double resolution; // resolution in megapixels
  final int shutterCount;

  Camera(
      {int? id,
      required make,
      required String model,
      required String serialNumber,
      required int value,
      required String valueCurrency,
      required String note,
      required this.sensorSize,
      required this.resolution,
      required this.shutterCount})
      : super(id, make, model, serialNumber, value, valueCurrency, note);
}
