import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';
import 'package:my_photo_gear/main.dart';

import '../../bloc/create_gear_cubit.dart';
import '../../data/db/data_source.dart';

class EditLensPage extends StatefulWidget {
  final PhotoGear? gear;

  const EditLensPage({Key? key, this.gear}) : super(key: key);

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
    if (widget.gear != null) {
      PhotoGear lens = widget.gear!;
      makeTextController.text = lens.make;
      modelTextController.text = lens.model;
      serialNoTextController.text = lens.serialNumber;
      valueTextController.text = lens.value.toString();
      valueCurrencyTextController.text = lens.valueCurrency;
      noteTextController.text = lens.note;
      Map<String, dynamic> properties = jsonDecode(lens.properties);
      maxApertureTextController.text = properties['maximumAperture'].toString();
      minApertureTextController.text = properties['minimumAperture'].toString();
      filterThreadTextController.text =
          properties['filterThreadDiameter'].toString();
      _checkboxState = properties['hasImageStabilization'] == "Yes";
    }
    return BlocProvider<CreateGearCubit>(
        create: (context) {
          return CreateGearCubit(context.read<DataSource>());
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.gear == null
                  ? "Add a lens"
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                              const InputDecoration(hintText: "Lens make"),
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
                              const InputDecoration(hintText: "Lens model"),
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
                              hintText: "Lens serial number"),
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
                                      hintText: "Lens price"),
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
                                textCapitalization:
                                    TextCapitalization.characters,
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
                                decoration: const InputDecoration(
                                    hintText: "Max aperture"),
                                controller: maxApertureTextController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Flexible(
                                child: TextField(
                              decoration: const InputDecoration(
                                  hintText: "Min aperture"),
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
                          decoration: const InputDecoration(
                              hintText: "Filter thread size"),
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
                      maxApertureTextController.text.isNotEmpty &&
                      minApertureTextController.text.isNotEmpty &&
                      filterThreadTextController.text.isNotEmpty) {
                    Map<String, dynamic> properties = {
                      'maximumAperture':
                          double.parse(maxApertureTextController.value.text),
                      'minimumAperture':
                          double.parse(minApertureTextController.value.text),
                      'filterThreadDiameter':
                          int.parse(filterThreadTextController.value.text),
                      'hasImageStabilization': _checkboxState ? "Yes" : "No"
                    };

                    await context.read<CreateGearCubit>().submitGear(
                        (widget.gear == null) ? null : widget.gear!.id,
                        makeTextController.value.text,
                        modelTextController.value.text,
                        serialNoTextController.value.text,
                        int.parse(valueTextController.value.text),
                        valueCurrencyTextController.value.text,
                        noteTextController.value.text,
                        PhotoGearType.gearLens,
                        jsonEncode(properties));

                    Navigator.pop(context, true);
                    // go back one more level to hide the dialog window if not editing
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
            )));
  }

  @override
  void dispose() {
    makeTextController.dispose();
    modelTextController.dispose();
    serialNoTextController.dispose();
    valueTextController.dispose();
    valueCurrencyTextController.dispose();
    minApertureTextController.dispose();
    maxApertureTextController.dispose();
    filterThreadTextController.dispose();
    noteTextController.dispose();
    super.dispose();
  }
}
