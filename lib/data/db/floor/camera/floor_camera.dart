import 'package:floor/floor.dart';

@Entity(tableName: "camera")
class FloorCamera {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String make;
  String model;
  String serialNumber;
  String note;
  int sensorSize;
  double resolution;
  int shutterCount;

  FloorCamera(
      {this.id,
      required this.make,
      required this.model,
      required this.serialNumber,
      required this.note,
      required this.sensorSize,
      required this.resolution,
      required this.shutterCount});
}
