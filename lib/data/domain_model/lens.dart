import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

class Lens extends PhotoGear {
  final double maximumAperture;
  final double minimumAperture;
  final int filterThreadDiameter;
  final bool hasImageStabilization;

  Lens(
      int? id,
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      this.maximumAperture,
      this.minimumAperture,
      this.filterThreadDiameter,
      this.hasImageStabilization)
      : super(id, make, model, serialNumber, value, valueCurrency, note);
}
