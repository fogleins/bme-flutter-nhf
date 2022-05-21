import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

enum SensorSize { apsC, fullFrame }

class Camera extends PhotoGear {
  final SensorSize sensorSize;
  final double resolution; // resolution in megapixels
  final int shutterCount;

  Camera(
      int? id,
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      this.sensorSize,
      this.resolution,
      this.shutterCount)
      : super(id, make, model, serialNumber, value, valueCurrency, note);
}
