import 'package:floor/floor.dart';
import 'package:my_photo_gear/data/db/floor/lens/floor_lens.dart';

@dao
abstract class FloorLensDao {
  @Query("SELECT * FROM lens")
  Future<List<FloorLens>> getAllLenses();

  @Query("SELECT * FROM lens WHERE id = :id")
  Future<FloorLens?> getLensById(int id);

  @Query("DELETE FROM lens WHERE id = :id")
  Future<void> deleteLens(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateOrInsertLens(FloorLens lens);
}