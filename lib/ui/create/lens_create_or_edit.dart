import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/domain_model/lens.dart';
import 'package:my_photo_gear/main.dart';

late Function onUpdateCallback;

class EditLensPage extends StatefulWidget {
  EditLensPage({Key? key, required Function cbTo}) : super(key: key) {
    onUpdateCallback = cbTo;
  }


  @override
  _EditLensPageState createState() => _EditLensPageState();
}

class _EditLensPageState extends State<EditLensPage> {
  _EditLensPageState();

  static const double topPadding = 20.0;
  bool _checkboxState = false;

  final makeTextController = TextEditingController();
  final modelTextController = TextEditingController();
  final serialNoTextController = TextEditingController();
  final valueTextController = TextEditingController();
  final valueCurrencyTextController = TextEditingController();
  final noteTextController = TextEditingController();
  final maxApertureTextController = TextEditingController();
  final minApertureTextController = TextEditingController();
  final filterThreadTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
      appBar: AppBar(
        title: const Text("Add a lens"),
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
              decoration: const InputDecoration(hintText: "Lens make"),
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
              decoration: const InputDecoration(hintText: "Lens model"),
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
              decoration: const InputDecoration(hintText: "Lens serial number"),
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
                      decoration: const InputDecoration(hintText: "Lens price"),
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
                "Aperture",
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Max aperture"),
                    controller: maxApertureTextController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                    child: TextField(
                  decoration: const InputDecoration(hintText: "Min aperture"),
                  controller: minApertureTextController,
                  keyboardType: TextInputType.number,
                )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: Text(
                "Filter thread diameter",
                textAlign: TextAlign.start,
              ),
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Filter thread size"),
              controller: filterThreadTextController,
              keyboardType: TextInputType.number,
            ),
            const Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: Text(
                "Image stabilization",
                textAlign: TextAlign.start,
              ),
            ),
            Row(children: [
              Checkbox(
                value: _checkboxState,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxState = value!;
                  });
                },
              ),
              const Text("Lens features image stabilization")
            ])
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
              maxApertureTextController.text.isNotEmpty &&
              minApertureTextController.text.isNotEmpty &&
              filterThreadTextController.text.isNotEmpty) {
            Lens lens = Lens(
                -1,
                makeTextController.text,
                modelTextController.text,
                serialNoTextController.text,
                int.parse(valueTextController.text),
                valueCurrencyTextController.text,
                noteTextController.text,
                double.parse(maxApertureTextController.text),
                double.parse(minApertureTextController.text),
                int.parse(filterThreadTextController.text),
                _checkboxState);
            await dataSource.updateOrInsertLens(lens);
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
