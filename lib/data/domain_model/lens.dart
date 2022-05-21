import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

class Lens extends PhotoGear {
  final double maximumAperture;
  final double minimumAperture;
  final int filterThreadDiameter;
  final bool hasImageStabilization;

  Lens(
      String make,
      String model,
      String serialNumber,
      String note,
      this.maximumAperture,
      this.minimumAperture,
      this.filterThreadDiameter,
      this.hasImageStabilization)
      : super(make, model, serialNumber, note);
}
