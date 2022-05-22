import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/db/floor/camera/floor_camera_repository.dart';
import 'package:my_photo_gear/data/db/floor/lens/floor_lens_repository.dart';
import 'package:my_photo_gear/data/domain_model/lens.dart';
import 'package:my_photo_gear/ui/create/camera_create_or_edit.dart';
import 'package:my_photo_gear/ui/create/lens_create_or_edit.dart';
import 'package:my_photo_gear/ui/list/photo_gear_list_item.dart';

import 'data/domain_model/camera.dart';

late DataSource dataSource;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FloorCameraRepository floorCameraRepo = FloorCameraRepository();
  FloorLensRepository floorLensRepo = FloorLensRepository();
  await floorCameraRepo.init();
  await floorLensRepo.init();
  dataSource =
      DataSource(floorCameraRepo, floorLensRepo);
  await dataSource.init();

  MyPhotoGearApp app = const MyPhotoGearApp();
  runApp(app);
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

// TODO
class MyPhotoGearHomePage extends StatefulWidget {
  const MyPhotoGearHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyPhotoGearHomePage> createState() => _MyPhotoGearHomePageState();
}

// TODO
class _MyPhotoGearHomePageState extends State<MyPhotoGearHomePage> with WidgetsBindingObserver {
  static final List<PhotoGearListItem> listItems = <PhotoGearListItem>[];
  static late EditCameraPage editCameraPage;
  static late EditLensPage editLensPage;
  _MyPhotoGearHomePageState() {
    editCameraPage = EditCameraPage(cbTo: updateLists);
    editLensPage = EditLensPage(cbTo: updateLists);
  }

  static Route<Object?> _showChooserDialog(BuildContext context, Object? args) {
    return DialogRoute(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: const Text("What would you like to add?"),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => editCameraPage));
                  }, // TODO: start new activity
                  child: const Text("Camera", textScaleFactor: 1.1),
                ),
                SimpleDialogOption(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => editLensPage));
                    },
                    child: const Text("Lens", textScaleFactor: 1.1))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("MyPhotoGear")),
                  floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context)
                            .restorablePush(_showChooserDialog);
                      },
                      tooltip: "Add gear",
                      child: const Icon(Icons.add)),
                  body: SafeArea(child: getList()),
                ));
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed || state == AppLifecycleState.paused) {
      updateLists();
      build(context);
    // }
    super.didChangeAppLifecycleState(state);
  }
  
  void updateLists() async {
    final List<Camera> cameras = await dataSource.getAllCameras();
    final List<Lens> lenses = await dataSource.getAllLenses();
    // listItems.clear();
    List<PhotoGearListItem> newItems = [];

    // generate gui elements
    for (Camera camera in cameras) {
      newItems.add(CameraListItem(camera));
    }
    for (Lens lens in lenses) {
      newItems.add(LensListItem(lens));
    }
    setState(() {
      listItems.clear();
      listItems.addAll(newItems);
    });
  }

  ListView getList() {
    updateLists();
    sleep(const Duration(milliseconds: 50));
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        final listItem = listItems[index];
        return ListTile(
          title: listItem.buildTitle(context),
          subtitle: listItem.buildContent(context),
        );
      },
    );
  }
}
