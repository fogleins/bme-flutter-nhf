import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/domain_model/camera.dart';
import 'package:my_photo_gear/main.dart';

late Function onUpdateCallback;

class EditCameraPage extends StatefulWidget {
  EditCameraPage({Key? key, required Function cbTo}) : super(key: key) {
    onUpdateCallback = cbTo;
  }

  @override
  _EditCameraPageState createState() => _EditCameraPageState();
}

class _EditCameraPageState extends State<EditCameraPage> {
  _EditCameraPageState();

  static const double topPadding = 20.0;
  final List<String> sensorSizes = ["APS-C", "FullFrame"];
  String dropdownValue = "APS-C";

  final makeTextController = TextEditingController();
  final modelTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final valueTextController = TextEditingController();
  final valueCurrencyTextController = TextEditingController();
  final noteTextController = TextEditingController();
  final resolutionTextController = TextEditingController();
  final shutterCountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a camera"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
              decoration: const InputDecoration(hintText: "Shutter count"),
              controller: shutterCountTextController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
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
            Camera camera = Camera(
                -1,
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
            await dataSource.updateOrInsertCamera(camera);
            await onUpdateCallback();
            Navigator.pop(context, true);
            Navigator.pop(context, true);
          } else {
            const snackBar = SnackBar(
                content:
                    Text("Invalid input, please provide the necessary data."));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
