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

  FloorPhotoGearDao? _photoGearDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `photo_gear` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `make` TEXT NOT NULL, `model` TEXT NOT NULL, `serialNumber` TEXT NOT NULL, `value` INTEGER NOT NULL, `valueCurrency` TEXT NOT NULL, `type` INTEGER NOT NULL, `note` TEXT NOT NULL, `properties` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorPhotoGearDao get photoGearDao {
    return _photoGearDaoInstance ??=
        _$FloorPhotoGearDao(database, changeListener);
  }
}

class _$FloorPhotoGearDao extends FloorPhotoGearDao {
  _$FloorPhotoGearDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorPhotoGearInsertionAdapter = InsertionAdapter(
            database,
            'photo_gear',
            (FloorPhotoGear item) => <String, Object?>{
                  'id': item.id,
                  'make': item.make,
                  'model': item.model,
                  'serialNumber': item.serialNumber,
                  'value': item.value,
                  'valueCurrency': item.valueCurrency,
                  'type': item.type,
                  'note': item.note,
                  'properties': item.properties
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorPhotoGear> _floorPhotoGearInsertionAdapter;

  @override
  Future<List<FloorPhotoGear>> getAllGear() async {
    return _queryAdapter.queryList('SELECT * FROM photo_gear',
        mapper: (Map<String, Object?> row) => FloorPhotoGear(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            type: row['type'] as int,
            note: row['note'] as String,
            properties: row['properties'] as String));
  }

  @override
  Future<FloorPhotoGear?> getGearById(int id) async {
    return _queryAdapter.query('SELECT * FROM photo_gear WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorPhotoGear(
            id: row['id'] as int?,
            make: row['make'] as String,
            model: row['model'] as String,
            serialNumber: row['serialNumber'] as String,
            value: row['value'] as int,
            valueCurrency: row['valueCurrency'] as String,
            type: row['type'] as int,
            note: row['note'] as String,
            properties: row['properties'] as String),
        arguments: [id]);
  }

  @override
  Future<void> delete(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM photo_gear WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> updateOrInsert(FloorPhotoGear camera) async {
    await _floorPhotoGearInsertionAdapter.insert(
        camera, OnConflictStrategy.replace);
  }
}
