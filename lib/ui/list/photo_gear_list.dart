import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';
import 'package:my_photo_gear/ui/list/photo_gear_list_item.dart';

import '../../bloc/gear_cubit.dart';
import '../../data/db/data_source.dart';
import '../create/camera_create_or_edit.dart';
import '../create/lens_create_or_edit.dart';

class MyPhotoGearHomePage extends StatefulWidget {
  const MyPhotoGearHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPhotoGearHomePage> createState() => _MyPhotoGearHomePageState();
}

class _MyPhotoGearHomePageState extends State<MyPhotoGearHomePage> {
  _MyPhotoGearHomePageState();

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
                            builder: (_) => const EditCameraPage()));
                  },
                  child: const Text("Camera", textScaleFactor: 1.1),
                ),
                SimpleDialogOption(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EditLensPage()));
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
        child: Scaffold(
            appBar: AppBar(title: const Text("MyPhotoGear")),
            body: BlocBuilder<GearCubit, GearState>(builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GearLoaded) {

                List<PhotoGear> items = state.gear;
                int itemCount = items.length;

                return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final listItem = PhotoGearListItem(item);
                      return GestureDetector(
                        child: ListTile(
                          title: listItem.buildTitle(context),
                          subtitle: listItem.buildContent(context),
                        ),
                        onTap: () {
                          if (listItem.gear.type == PhotoGearType.gearCamera) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditCameraPage(
                                        gear: item,
                                        )));
                          } else if (listItem.gear.type ==
                              PhotoGearType.gearLens) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditLensPage(
                                          gear: listItem.gear,
                                        )));
                          }
                        },
                      );
                    });
              } else {
                return Container();
              }
            }),
            // fab
            floatingActionButton: BlocBuilder<GearCubit, GearState>(
              builder: (context, state) => FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).restorablePush(_showChooserDialog);
                    // Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (_) => const EditCameraPage()))
                    //     .then((_) => context.read<GearCubit>().getGear());
                  },
                  tooltip: "Add gear",
                  child: const Icon(Icons.add)),
            )));
  }
}
