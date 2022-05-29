import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/db/floor/photo_gear/floor_photo_gear_repository.dart';
import 'ui/list/photo_gear_list.dart';
import 'package:provider/provider.dart';


late DataSource dataSource;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FloorPhotoGearRepository gearRepository = FloorPhotoGearRepository();
  await gearRepository.init();
  dataSource = DataSource(gearRepository);
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
        home: const MyPhotoGearHomePage(title: "MyPhotoGear"),
    );
  }
}
