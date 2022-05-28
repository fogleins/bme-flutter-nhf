// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_photo_gear_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorPhotoGearDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorPhotoGearDatabaseBuilder databaseBuilder(String name) =>
      _$FloorPhotoGearDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorPhotoGearDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorPhotoGearDatabaseBuilder(null);
}

class _$FloorPhotoGearDatabaseBuilder {
  _$FloorPhotoGearDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorPhotoGearDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorPhotoGearDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorPhotoGearDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorPhotoGearDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorPhotoGearDatabase extends FloorPhotoGearDatabase {
  _$FloorPhotoGearDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorCameraDao? _cameraDaoInstance;

  FloorLensDao? _lensDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `camera` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `make` TEXT NOT NULL, `model` TEXT NOT NULL, `serialNumber` TEXT NOT NULL, `value` INTEGER NOT NULL, `valueCurrency` TEXT NOT NULL, `note` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `lens` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `make` TEXT NOT NULL, `model` TEXT NOT NULL, `serialNumber` TEXT NOT NULL, `value` INTEGER NOT NULL, `valueCurrency` TEXT NOT NULL, `note` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorCameraDao get cameraDao {
    return _cameraDaoInstance ??= _$FloorCameraDao(database, changeListener);
  }

  @override
  FloorLensDao get lensDao {
    return _lensDaoInstance ??= _$FloorLensDao(database, changeListener);
  }
}

class _$FloorCameraDao extends FloorCameraDao {
  _$FloorCameraDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorCameraInsertionAdapter = InsertionAdapter(
            database,
            'camera',
            (FloorCamera item) => <String, Object?>{
                  'id': item.id,
                  'make': item.make,
                  'model': item.model,
                  'serialNumber': item.serialNumber,
                  'value': item.value,
                  'valueCurrency': item.valueCurrency,
                  'note': item.note
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorCamera> _floorCameraInsertionAdapter;

  @override
  Future<List<FloorCamera>> getAllCameras() async {
    return _queryAdapter.queryList('SELECT * FROM camera',
        mapper: (Map<String, Object?> row) => FloorCamera(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            note: row['note'] as String));
  }

  @override
  Future<FloorCamera?> getCameraById(int id) async {
    return _queryAdapter.query('SELECT * FROM camera WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorCamera(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            note: row['note'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteCamera(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM camera WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> updateOrInsertCamera(FloorCamera camera) async {
    await _floorCameraInsertionAdapter.insert(
        camera, OnConflictStrategy.replace);
  }
}

class _$FloorLensDao extends FloorLensDao {
  _$FloorLensDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorLensInsertionAdapter = InsertionAdapter(
            database,
            'lens',
            (FloorLens item) => <String, Object?>{
                  'id': item.id,
                  'make': item.make,
                  'model': item.model,
                  'serialNumber': item.serialNumber,
                  'value': item.value,
                  'valueCurrency': item.valueCurrency,
                  'note': item.note
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorLens> _floorLensInsertionAdapter;

  @override
  Future<List<FloorLens>> getAllLenses() async {
    return _queryAdapter.queryList('SELECT * FROM lens',
        mapper: (Map<String, Object?> row) => FloorLens(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            note: row['note'] as String));
  }

  @override
  Future<FloorLens?> getLensById(int id) async {
    return _queryAdapter.query('SELECT * FROM lens WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorLens(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            note: row['note'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteLens(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM lens WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> updateOrInsertLens(FloorLens lens) async {
    await _floorLensInsertionAdapter.insert(lens, OnConflictStrategy.replace);
  }
}
