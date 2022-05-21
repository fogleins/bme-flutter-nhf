import 'package:floor/floor.dart';

@Entity(tableName: "lens")
class FloorLens {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String make;
  String model;
  String serialNumber;
  String note;
  double maximumAperture;
  double minimumAperture;
  int filterThreadDiameter;
  bool hasImageStabilization;

  FloorLens(
      {this.id,
      required this.make,
      required this.model,
      required this.serialNumber,
      required this.note,
      required this.maximumAperture,
      required this.minimumAperture,
      required this.filterThreadDiameter,
      required this.hasImageStabilization});
}