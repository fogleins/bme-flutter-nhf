import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:my_photo_gear/data/db/floor/camera/floor_camera.dart';
import 'camera/floor_camera_dao.dart';
import 'lens/floor_lens.dart';
import 'lens/floor_lens_dao.dart';

part 'floor_photo_gear_database.g.dart';

@Database(
  version: 1,
  entities: [
    FloorCamera,
    FloorLens
  ]
)
abstract class FloorPhotoGearDatabase extends FloorDatabase {
  FloorCameraDao get cameraDao;
  FloorLensDao get lensDao;
}