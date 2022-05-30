import 'package:flutter/material.dart';
import 'package:my_photo_gear/ui/create/camera_create_or_edit.dart';

import 'lens_create_or_edit.dart';

class ChooserPage extends StatefulWidget {
  const ChooserPage({Key? key})
      : super(key: key);

  @override
  _ChooserPageState createState() => _ChooserPageState();
}

class _ChooserPageState extends State<ChooserPage> {
  _ChooserPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add gear"),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              child: const Text("Camera"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const EditCameraPage()));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditLensPage()));
                },
                child: const Text("Lens"))
          ],
        )));
  }
}
