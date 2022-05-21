import 'package:my_photo_gear/data/db/floor/camera/floor_camera.dart';
import 'package:my_photo_gear/data/db/floor/lens/floor_lens.dart';
import 'package:my_photo_gear/data/db/photo_gear_repository.dart';

import '../domain_model/camera.dart';
import '../domain_model/lens.dart';

class DataSource {
  final PhotoGearRepository<FloorCamera> cameraDatabase;
  final PhotoGearRepository<FloorLens> lensDatabase;

  DataSource(this.cameraDatabase, this.lensDatabase);

  Future<void> init() async {
    await cameraDatabase.init();
    await lensDatabase.init();
  }

  // camera
  Future<List<Camera>> getAllCameras() async {
    final cameras = await cameraDatabase.getAll();
    return cameras.map((floorCamera) => floorCamera.toDomainModel()).toList();
  }

  Future<Camera> getCamera(int id) async {
    final floorCamera = await cameraDatabase.getById(id);
    return floorCamera.toDomainModel();
  }

  Future<void> updateOrInsertCamera(Camera camera) async {
    return cameraDatabase.updateOrInsert(camera.toDbModel());
  }

  Future<void> deleteCamera(Camera camera) async {
    return cameraDatabase.delete(camera.toDbModel());
  }

  // lens
  Future<List<Lens>> getAllLenses() async {
    final lenses = await lensDatabase.getAll();
    return lenses.map((floorLens) => floorLens.toDomainModel()).toList();
  }

  Future<Lens> getLens(int id) async {
    final floorLens = await lensDatabase.getById(id);
    return floorLens.toDomainModel();
  }

  Future<void> updateOrInsertLens(Lens lens) async {
    return lensDatabase.updateOrInsert(lens.toDbModel());
  }

  Future<void> deleteLens(Lens lens) async {
    return lensDatabase.delete(lens.toDbModel());
  }
}

extension FloorCameraToCamera on FloorCamera {
  Camera toDomainModel() {
    SensorSize sensorSize;
    switch (this.sensorSize) {
      case 0:
        sensorSize = SensorSize.apsC;
        break;
      case 1:
        sensorSize = SensorSize.fullFrame;
        break;
      default:
        throw ArgumentError("Cannot convert number to enum");
    }
    return Camera(id, make, model, serialNumber, note, sensorSize, resolution,
        shutterCount);
  }
}

extension CameraToFloorCamera on Camera {
  FloorCamera toDbModel() {
    return FloorCamera(
        make: make,
        model: model,
        serialNumber: serialNumber,
        note: note,
        sensorSize: sensorSize.index,
        resolution: resolution,
        shutterCount: shutterCount);
  }
}

extension FloorLensToLens on FloorLens {
  Lens toDomainModel() {
    return Lens(id, make, model, serialNumber, note, maximumAperture,
        minimumAperture, filterThreadDiameter, hasImageStabilization);
  }
}

extension LensToFloorLens on Lens {
  FloorLens toDbModel() {
    return FloorLens(
        make: make,
        model: model,
        serialNumber: serialNumber,
        note: note,
        maximumAperture: maximumAperture,
        minimumAperture: minimumAperture,
        filterThreadDiameter: filterThreadDiameter,
        hasImageStabilization: hasImageStabilization);
  }
}
