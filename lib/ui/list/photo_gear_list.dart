import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/bloc/cameras_cubit.dart';
import 'package:my_photo_gear/ui/list/photo_gear_list_item.dart';

import '../../data/db/data_source.dart';
import '../../data/domain_model/camera.dart';
import '../../data/domain_model/lens.dart';
import '../create/camera_create_or_edit.dart';
import '../create/lens_create_or_edit.dart';

class MyPhotoGearHomePage extends StatefulWidget {
  const MyPhotoGearHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPhotoGearHomePage> createState() => _MyPhotoGearHomePageState();
}

class _MyPhotoGearHomePageState extends State<MyPhotoGearHomePage>
    with WidgetsBindingObserver {
  static final List<PhotoGearListItem> listItems = <PhotoGearListItem>[];
  static late EditCameraPage editCameraPage;
  static late EditLensPage editLensPage;

  _MyPhotoGearHomePageState() {
    editCameraPage = EditCameraPage(onUpdateCallback: updateLists);
    editLensPage = EditLensPage(onUpdateCallback: updateLists);
  }

  static Route<Object?> _showChooserDialog(BuildContext context, Object? args) {
    return DialogRoute(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: const Text("What would you like to add?"),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => editCameraPage));
                  },
                  child: const Text("Camera", textScaleFactor: 1.1),
                ),
                SimpleDialogOption(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => editLensPage));
                    },
                    child: const Text("Lens", textScaleFactor: 1.1))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GearCubit>(
        create: (context) {
          return GearCubit(context.read<DataSource>());
        },
        child: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(title: const Text("MyPhotoGear")),
                floatingActionButton: BlocBuilder<GearCubit, GearState>(
                  builder: (context, state) => FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context)
                            .restorablePush(_showChooserDialog);
                      },
                      tooltip: "Add gear",
                      child: const Icon(Icons.add)),
                ),
                body: BlocBuilder<GearCubit, GearState>(//getList(),
                    builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AllGearLoaded) {
                    List<Camera> cameras = state.cameras;
                    List<Lens> lenses = state.lenses;
                    List<PhotoGearListItem> items = [];

                    // generate gui elements
                    for (Camera camera in cameras) {
                      items.add(CameraListItem(camera));
                    }
                    for (Lens lens in lenses) {
                      items.add(LensListItem(lens));
                    }
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final listItem = items[index];
                          return GestureDetector(
                            child: ListTile(
                              title: listItem.buildTitle(context),
                              subtitle: listItem.buildContent(context),
                            ),
                            onTap: () {
                              if (listItem is CameraListItem) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditCameraPage(
                                              onUpdateCallback: updateLists,
                                              camera: listItem.camera,
                                            )));
                              } else if (listItem is LensListItem) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditLensPage(
                                              onUpdateCallback: updateLists,
                                              lens: listItem.lens,
                                            )));
                              }
                            },
                          );
                        });

                    // itemCount: itemCount,
                    // itemBuilder: (context, index) {

                  } else {
                    return Container();
                  }
                }))));
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
    // final List<Camera> cameras = await dataSource.getAllCameras();
    // final List<Lens> lenses = await dataSource.getAllLenses();
    List<PhotoGearListItem> newItems = [];

    // generate gui elements
    // for (Camera camera in cameras) {
    //   newItems.add(CameraListItem(camera));
    // }
    // for (Lens lens in lenses) {
    //   newItems.add(LensListItem(lens));
    // }
    setState(() {
      listItems.clear();
      listItems.addAll(newItems);
    });
  }

  ListView getList() {
    updateLists();
    return ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        final listItem = listItems[index];
        return GestureDetector(
          child: ListTile(
            title: listItem.buildTitle(context),
            subtitle: listItem.buildContent(context),
          ),
          onTap: () {
            if (listItem is CameraListItem) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditCameraPage(
                            onUpdateCallback: updateLists,
                            camera: listItem.camera,
                          )));
            } else if (listItem is LensListItem) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EditLensPage(
                            onUpdateCallback: updateLists,
                            lens: listItem.lens,
                          )));
            }
          },
        );
      },
    );
  }
}
