import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear.dart';
import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear_dao.dart';

import '../../photo_gear_repository.dart';
import '../floor_photo_gear_database.dart';

class FloorPhotoGearRepository implements PhotoGearRepository<FloorPhotoGear> {
  late FloorPhotoGearDao photoGearDao;

  @override
  Future<void> init() async {
    final database = await $FloorFloorPhotoGearDatabase
        .databaseBuilder("floor_photo_gear.db")
        .build();
    photoGearDao = database.photoGearDao;
  }

  @override
  Future<void> delete(FloorPhotoGear gear) {
    return photoGearDao.delete(gear.id ?? -1);
  }

  @override
  Future<List<FloorPhotoGear>> getAll() {
    return photoGearDao.getAllGear();
  }

  @override
  Future<FloorPhotoGear> getById(int id) async {
    final gear = await photoGearDao.getGearById(id);
    if (gear == null) {
      throw Exception("Invalid ID");
    } else {
      return gear;
    }
  }

  @override
  Future<void> updateOrInsert(FloorPhotoGear gear) {
    return photoGearDao.updateOrInsert(gear);
  }
}