import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_photo_gear/bloc/camera_create_or_edit_cubit.dart';
// import 'package:my_photo_gear/bloc/camera_details_cubit.dart';
import 'package:my_photo_gear/data/domain_model/camera.dart';
import 'package:my_photo_gear/main.dart';

import '../../bloc/cubit/camera_cubit.dart';
import '../../data/db/data_source.dart';

class EditCameraPage extends StatefulWidget {
  final Camera? camera;
  final Function onUpdateCallback;

  const EditCameraPage({Key? key, required this.onUpdateCallback, this.camera})
      : super(key: key);

  @override
  _EditCameraPageState createState() => _EditCameraPageState();
}

class _EditCameraPageState extends State<EditCameraPage> {
  _EditCameraPageState();

  static const double topPadding = 20.0;
  final List<String> sensorSizes = ["APS-C", "FullFrame"];
  String dropdownValue = "APS-C";
  String title = "Add a camera";

  final makeTextController = TextEditingController();
  final modelTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final valueTextController = TextEditingController();
  final valueCurrencyTextController = TextEditingController();
  final noteTextController = TextEditingController();
  final resolutionTextController = TextEditingController();
  final shutterCountTextController = TextEditingController();

  void _setTextControllers() {
    Camera camera = widget.camera!;
    makeTextController.text = camera.make;
    modelTextController.text = camera.model;
    serialNoTextController.text = camera.serialNumber;
    valueTextController.text = camera.value.toString();
    valueCurrencyTextController.text = camera.valueCurrency;
    noteTextController.text = camera.note;
    // resolutionTextController.text = camera.resolution.toString();
    // shutterCountTextController.text = camera.shutterCount.toString();
    // dropdownValue =
    // camera.sensorSize.index == 0 ? sensorSizes[0] : sensorSizes[1];
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<CamerasCubit>();
    if (widget.camera != null) {
      // Camera camera = widget.camera!;
      // makeTextController.text = camera.make;
      // modelTextController.text = camera.model;
      // serialNoTextController.text = camera.serialNumber;
      // valueTextController.text = camera.value.toString();
      // valueCurrencyTextController.text = camera.valueCurrency;
      // noteTextController.text = camera.note;
      // resolutionTextController.text = camera.resolution.toString();
      // shutterCountTextController.text = camera.shutterCount.toString();
      // dropdownValue =
      //     camera.sensorSize.index == 0 ? sensorSizes[0] : sensorSizes[1];
      _setTextControllers();
    }
    // return BlocProvider<CreateOrEditCameraCubit>(
    return BlocProvider<CameraCubit>(
      create: (context) {
        if (widget.camera == null) {
          context.read<CameraCubit>().getCamera(null);
        }
        return CameraCubit(
            context.read<DataSource>() /*, widget.camera?.id!*/);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.camera == null
              ? "Add a camera"
              : "Edit ${widget.camera!.make} ${widget.camera!.model}"),
          actions: [
            IconButton(
                onPressed: widget.camera == null
                    ? null
                    : () async {
                        await dataSource.deleteCamera(widget.camera!);
                        Navigator.pop(context, true);
                        var snackBar = SnackBar(
                            content: Text(
                                "${widget.camera!.make} ${widget.camera!.model} deleted."));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                icon: const Icon(Icons.delete_outline))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<CameraCubit, CameraState>(
              builder: (context, state) {
            if (state is CameraInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CameraCreateState 
                || state is CameraEditState) { // new camera
              if (state is CameraEditState) {
                _setTextControllers();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Make",
                    textAlign: TextAlign.start,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Camera make"),
                    controller: makeTextController,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Model",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Camera model"),
                    controller: modelTextController,
                    textCapitalization: TextCapitalization.words,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Serial number",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: "Camera serial number"),
                    controller: serialNoTextController,
                    textCapitalization: TextCapitalization.characters,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Value",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextField(
                            decoration:
                                const InputDecoration(hintText: "Camera price"),
                            controller: valueTextController,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                            child: TextField(
                          decoration: const InputDecoration(
                              hintText: "Currency (e.g. EUR, USD, HUF)"),
                          controller: valueCurrencyTextController,
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 3,
                        )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding - 12),
                    child: Text(
                      "Note",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Note"),
                    controller: noteTextController,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Sensor size",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          items: sensorSizes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Resolution",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: "Resolution"),
                    controller: resolutionTextController,
                    keyboardType: TextInputType.number,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      "Shutter count",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: "Shutter count"),
                    controller: shutterCountTextController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
        )),
        floatingActionButton: FloatingActionButton(
          tooltip: "Save",
          onPressed: () async {
            if (makeTextController.text.isNotEmpty &&
                modelTextController.text.isNotEmpty &&
                serialNoTextController.text.isNotEmpty &&
                valueTextController.text.isNotEmpty &&
                valueCurrencyTextController.text.isNotEmpty &&
                resolutionTextController.text.isNotEmpty &&
                shutterCountTextController.text.isNotEmpty) {
              // Camera camera = Camera(
              //     ));
              // await dataSource.updateOrInsertCamera(camera);
              // cubit.updateOrInsertCamera(camera);

              /*
              await context.read<CameraCubit>().submitCamera(
                  // make, model, serialNumber, value, valueCurrency, note, sensorSize, resolution, shutterCount
                  widget.camera == null ? -1 : widget.camera!.id,
                  makeTextController.text,
                  modelTextController.text,
                  serialNoTextController.text,
                  int.parse(valueTextController.text),
                  valueCurrencyTextController.text,
                  noteTextController.text,
                  sensorSizes.indexOf(dropdownValue) == 0
                      ? SensorSize.apsC
                      : SensorSize.fullFrame,
                  // sensor size
                  double.parse(resolutionTextController.text),
                  int.parse(shutterCountTextController.text));
              */

              // await widget.onUpdateCallback();
              Navigator.pop(context, true);
              // go back one more level if editing to close the dialog window
              if (widget.camera == null) {
                Navigator.pop(context, true);
              }
            } else {
              const snackBar = SnackBar(
                  content: Text(
                      "Invalid input, please provide the necessary data."));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
    /*
    } else {
      // if widget.camera == null, aka adding a new one
      return BlocProvider<CreateOrEditCameraCubit>(
        create: (context) {
          return CreateOrEditCameraCubit(
            context.read<DataSource>(),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Add a camera"),
            actions: [
              IconButton(
                  onPressed: widget.camera == null
                      ? null
                      : () async {
                          await dataSource.deleteCamera(widget.camera!);
                          Navigator.pop(context, true);
                          var snackBar = SnackBar(
                              content: Text(
                                  "${widget.camera!.make} ${widget.camera!.model} deleted."));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                  icon: const Icon(Icons.delete_outline))
            ],
          ),
          body: SingleChildScrollView(
            child:
                BlocBuilder<CreateOrEditCameraCubit, CreateOrEditCameraState>(
                    builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Make",
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Camera make"),
                        controller: makeTextController,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Model",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Camera model"),
                        controller: modelTextController,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Serial number",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            hintText: "Camera serial number"),
                        controller: serialNoTextController,
                        textCapitalization: TextCapitalization.characters,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Value",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: "Camera price"),
                                controller: valueTextController,
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                                child: TextField(
                              decoration: const InputDecoration(
                                  hintText: "Currency (e.g. EUR, USD, HUF)"),
                              controller: valueCurrencyTextController,
                              textCapitalization: TextCapitalization.characters,
                              maxLength: 3,
                            )),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding - 12),
                        child: Text(
                          "Note",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: "Note"),
                        controller: noteTextController,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Sensor size",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              items: sensorSizes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Resolution",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Resolution"),
                        controller: resolutionTextController,
                        keyboardType: TextInputType.number,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: topPadding),
                        child: Text(
                          "Shutter count",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Shutter count"),
                        controller: shutterCountTextController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ));
            }),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Save",
            onPressed: () async {
              if (makeTextController.text.isNotEmpty &&
                  modelTextController.text.isNotEmpty &&
                  serialNoTextController.text.isNotEmpty &&
                  valueTextController.text.isNotEmpty &&
                  valueCurrencyTextController.text.isNotEmpty &&
                  resolutionTextController.text.isNotEmpty &&
                  shutterCountTextController.text.isNotEmpty) {
                await context.read<CreateOrEditCameraCubit>().submitCamera(
                    makeTextController.text,
                    modelTextController.text,
                    serialNoTextController.text,
                    int.parse(valueTextController.text),
                    valueCurrencyTextController.text,
                    noteTextController.text,
                    sensorSizes.indexOf(dropdownValue) == 0
                        ? SensorSize.apsC
                        : SensorSize.fullFrame,
                    // sensor size
                    double.parse(resolutionTextController.text),
                    int.parse(shutterCountTextController.text));
                Navigator.pop(context, true);
                // go back one more level if editing to close the dialog window
                if (widget.camera == null) {
                  Navigator.pop(context, true);
                }
              } else {
                const snackBar = SnackBar(
                    content: Text(
                        "Invalid input, please provide the necessary data."));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Icon(Icons.save),
          ),
        ),
      );
    }*/
  }
}
