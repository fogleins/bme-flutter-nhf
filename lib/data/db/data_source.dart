import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear.dart';
import 'package:my_photo_gear/data/db/photo_gear_repository.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

class DataSource {
  final PhotoGearRepository<FloorPhotoGear> gearDatabase;

  DataSource(this.gearDatabase);

  Future<void> init() async {
    await gearDatabase.init();
  }

  Future<List<PhotoGear>> getAllGear() async {
    final gear = await gearDatabase.getAll();
    return gear.map((floorGear) => floorGear.toDomainModel()).toList();
  }

  Future<PhotoGear> getGear(int id) async {
    final floorGear = await gearDatabase.getById(id);
    return floorGear.toDomainModel();
  }

  Future<void> updateOrInsertGear(PhotoGear gear) async {
    return gearDatabase.updateOrInsert(gear.toDbModel());
  }

  Future<void> deleteGear(PhotoGear gear) async {
    return gearDatabase.delete(gear.toDbModel());
  }
}

extension FloorGearToGear on FloorPhotoGear {
  PhotoGear toDomainModel() {
    return PhotoGear(
        id: id,
        make: make,
        model: model,
        serialNumber: serialNumber,
        value: value,
        valueCurrency: valueCurrency,
        note: note,
        type: type == 0 ? PhotoGearType.gearCamera : PhotoGearType.gearLens,
        properties: properties);
  }
}

extension GearToFloorGear on PhotoGear {
  FloorPhotoGear toDbModel() {
    return FloorPhotoGear(
        id: id,
        make: make,
        model: model,
        serialNumber: serialNumber,
        value: value,
        valueCurrency: valueCurrency,
        note: note,
        type: type.index,
        properties: properties);
  }
}
