abstract class PhotoGearRepository<T> {
  Future<void> init();
  Future<List<T>> getAll();
  Future<T> getById(int id);
  Future<void> updateOrInsert(T gear);
  Future<void> delete(T gear);
}