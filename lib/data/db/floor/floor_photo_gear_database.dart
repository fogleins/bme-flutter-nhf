import 'dart:async';

import 'package:floor/floor.dart';
import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear.dart';
import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_photo_gear_database.g.dart';

@Database(
  version: 1,
  entities: [
    FloorPhotoGear
  ]
)
abstract class FloorPhotoGearDatabase extends FloorDatabase {
  FloorPhotoGearDao get photoGearDao;
}