import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/db/floor/camera/floor_camera_repository.dart';
import 'package:my_photo_gear/data/db/floor/lens/floor_lens_repository.dart';
import 'package:my_photo_gear/data/domain_model/lens.dart';
import 'package:my_photo_gear/ui/create/camera_create_or_edit.dart';
import 'package:my_photo_gear/ui/create/lens_create_or_edit.dart';
import 'package:my_photo_gear/ui/list/photo_gear_list_item.dart';
import 'ui/list/photo_gear_list.dart';
import 'package:provider/provider.dart';

import 'data/domain_model/camera.dart';

late DataSource dataSource;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FloorCameraRepository floorCameraRepo = FloorCameraRepository();
  FloorLensRepository floorLensRepo = FloorLensRepository();
  await floorCameraRepo.init();
  await floorLensRepo.init();
  dataSource = DataSource(floorCameraRepo, floorLensRepo);
  await dataSource.init();

  MyPhotoGearApp app = const MyPhotoGearApp();
  runApp(
    Provider<DataSource>(
      create: (_) => dataSource,
      child: app
    )
  );
}

class MyPhotoGearApp extends StatelessWidget {
  const MyPhotoGearApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MyPhotoGear",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SafeArea(
          child: MyPhotoGearHomePage(title: "MyPhotoGear"),
        ));
  }
}
