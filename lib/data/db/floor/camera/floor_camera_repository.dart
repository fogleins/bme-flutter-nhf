import 'package:my_photo_gear/data/db/floor/camera/floor_camera.dart';
import 'package:my_photo_gear/data/db/floor/camera/floor_camera_dao.dart';
import 'package:my_photo_gear/data/db/floor/floor_photo_gear_database.dart';
import 'package:my_photo_gear/data/db/photo_gear_repository.dart';

class FloorCameraRepository implements PhotoGearRepository<FloorCamera> {
  late FloorCameraDao cameraDao;

  @override
  Future<void> init() async {
    final database = await $FloorFloorPhotoGearDatabase
        .databaseBuilder("floor_photo_gear.db")
        .build();
    cameraDao = database.cameraDao;
  }

  @override
  Future<void> delete(FloorCamera camera) {
    return cameraDao.deleteCamera(camera.id ?? -1);
  }

  @override
  Future<List<FloorCamera>> getAll() {
    return cameraDao.getAllCameras();
  }

  @override
  Future<FloorCamera> getById(int id) async {
    final camera = await cameraDao.getCameraById(id);
    if (camera == null) {
      throw Exception("Invalid camera ID");
    } else {
      return camera;
    }
  }

  @override
  Future<void> updateOrInsert(FloorCamera camera) {
    return cameraDao.updateOrInsertCamera(camera);
  }
}
