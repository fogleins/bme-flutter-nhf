import 'package:my_photo_gear/data/db/floor/floor_photo_gear_database.dart';
import 'package:my_photo_gear/data/db/floor/lens/floor_lens_dao.dart';
import 'package:my_photo_gear/data/db/photo_gear_repository.dart';

import 'floor_lens.dart';

class FloorLensRepository implements PhotoGearRepository<FloorLens> {
  late FloorLensDao lensDao;

  @override
  Future<void> init() async {
    final database = await $FloorFloorPhotoGearDatabase
        .databaseBuilder("floor_photo_gear.db")
        .build();
    lensDao = database.lensDao;
  }

  @override
  Future<void> delete(FloorLens lens) {
    return lensDao.deleteLens(lens.id ?? -1);
  }

  @override
  Future<List<FloorLens>> getAll() {
    return lensDao.getAllLenses();
  }

  @override
  Future<FloorLens> getById(int id) async {
    final lens = await lensDao.getLensById(id);
    if (lens == null) {
      throw Exception("Invalid lens ID");
    } else {
      return lens;
    }
  }

  @override
  Future<void> updateOrInsert(FloorLens lens) {
    return lensDao.updateOrInsertLens(lens);
  }
}
