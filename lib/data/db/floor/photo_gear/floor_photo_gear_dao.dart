import 'package:floor/floor.dart';

import 'floor_photo_gear.dart';

@dao
abstract class FloorPhotoGearDao {
  @Query("SELECT * FROM photo_gear")
  Future<List<FloorPhotoGear>> getAllGear();

  @Query("SELECT * FROM photo_gear WHERE id = :id")
  Future<FloorPhotoGear?> getGearById(int id);

  @Query("DELETE FROM photo_gear WHERE id = :id")
  Future<void> delete(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateOrInsert(FloorPhotoGear camera);
}
