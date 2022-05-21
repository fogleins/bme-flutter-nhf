abstract class PhotoGear {
  final int? id;
  final String make;
  final String model;
  final String serialNumber;
  final int value;
  final String valueCurrency;
  final String note;

  PhotoGear(this.id, this.make, this.model, this.serialNumber, this.value,
      this.valueCurrency, this.note);
}
