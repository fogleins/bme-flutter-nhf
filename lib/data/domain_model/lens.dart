import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

class Lens extends PhotoGear {
  final int filterThreadDiameter;
  final bool hasImageStabilization;

  Lens(String make, String model, String serialNumber, String note,
      this.filterThreadDiameter, this.hasImageStabilization)
      : super(make, model, serialNumber, note);
}
