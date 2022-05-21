import 'package:floor/floor.dart';

import 'floor_camera.dart';

@dao
abstract class FloorCameraDao {
  @Query("SELECT * FROM camera")
  Future<List<FloorCamera>> getAllCameras();

  @Query("SELECT * FROM camera WHERE id = :id")
  Future<FloorCamera?> getCameraById(int id);

  @Query("DELETE FROM camera WHERE id = :id")
  Future<void> deleteCamera(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateOrInsertCamera(FloorCamera camera);
}
