import 'package:floor/floor.dart';

@Entity(tableName: "photo_gear")
class FloorPhotoGear {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String make;
  String model;
  String serialNumber;
  int value;
  String valueCurrency;
  int type;
  String note;
  String properties;

  FloorPhotoGear({this.id,
    required this.make,
    required this.model,
    required this.serialNumber,
    required this.value,
    required this.valueCurrency,
    required this.type,
    required this.note,
    required this.properties,
  });
}
