import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/bloc/create_gear_cubit.dart';

import '../../data/db/data_source.dart';
import '../../data/domain_model/photo_gear_base.dart';
import '../../main.dart';

class EditCameraPage extends StatefulWidget {
  final PhotoGear? gear;

  const EditCameraPage({Key? key, this.gear}) : super(key: key);

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
    PhotoGear camera = widget.gear!;
    makeTextController.text = camera.make;
    modelTextController.text = camera.model;
    serialNoTextController.text = camera.serialNumber;
    valueTextController.text = camera.value.toString();
    valueCurrencyTextController.text = camera.valueCurrency;
    noteTextController.text = camera.note;
    Map<String, dynamic> properties = jsonDecode(camera.properties);
    resolutionTextController.text = properties['resolution'].toString();
    shutterCountTextController.text = properties['shutterCount'].toString();
    dropdownValue =
        properties['sensorSize'];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gear != null) {
      _setTextControllers();
    }
    return BlocProvider<CreateGearCubit>(
        create: (context) {
          return CreateGearCubit(context.read<DataSource>());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.gear == null
                ? "Add a camera"
                : "Edit ${widget.gear!.make} ${widget.gear!.model}"),
            actions: [
              IconButton(
                  onPressed: widget.gear == null
                      ? null
                      : () async {
                          await dataSource.deleteGear(widget.gear!);
                          Navigator.pop(context, true);
                          var snackBar = SnackBar(
                              content: Text(
                                  "${widget.gear!.make} ${widget.gear!.model} deleted."));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                  icon: const Icon(Icons.delete_outline))
            ],
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<CreateGearCubit, CreateGearState>(
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
          floatingActionButton: BlocBuilder<CreateGearCubit, CreateGearState>(
            builder: (context, state) => FloatingActionButton(
              tooltip: "Save",
              onPressed: () async {
                if (makeTextController.text.isNotEmpty &&
                    modelTextController.text.isNotEmpty &&
                    serialNoTextController.text.isNotEmpty &&
                    valueTextController.text.isNotEmpty &&
                    valueCurrencyTextController.text.isNotEmpty &&
                    resolutionTextController.text.isNotEmpty &&
                    shutterCountTextController.text.isNotEmpty) {
                  Map<String, dynamic> properties = {
                    'sensorSize': dropdownValue,
                    'resolution':
                        int.parse(resolutionTextController.value.text),
                    'shutterCount':
                        int.parse(shutterCountTextController.value.text)
                  };

                  await context.read<CreateGearCubit>().submitGear(
                      (widget.gear == null) ? null : widget.gear!.id,
                      makeTextController.value.text,
                      modelTextController.value.text,
                      serialNoTextController.value.text,
                      int.parse(valueTextController.value.text),
                      valueCurrencyTextController.value.text,
                      noteTextController.value.text,
                      PhotoGearType.gearCamera,
                      jsonEncode(properties));

                  Navigator.pop(context);
                  // go back one more level if editing to close the dialog window
                  if (widget.gear == null) {
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
        ));
  }

  @override
  void dispose() {
    makeTextController.dispose();
    modelTextController.dispose();
    serialNoTextController.dispose();
    valueTextController.dispose();
    valueCurrencyTextController.dispose();
    shutterCountTextController.dispose();
    resolutionTextController.dispose();
    noteTextController.dispose();
    super.dispose();
  }
}
