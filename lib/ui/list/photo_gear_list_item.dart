import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

class PhotoGearListItem {
  PhotoGear gear;

  PhotoGearListItem(this.gear);

  Widget buildTitle(BuildContext context) {
    return Text(
      "${gear.make} ${gear.model}",
      style: Theme
          .of(context)
          .textTheme
          .headline5,
    );
  }

  Widget _getCameraDetailsUi() {
    Map<String, dynamic> properties = jsonDecode(gear.properties);
    return Row(
      children: [
        Column(
          // List of keys
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Serial number:", textAlign: TextAlign.start),
            const Text("Value:", textAlign: TextAlign.start),
            const Text("Sensor size:", textAlign: TextAlign.start),
            const Text("Resolution:"),
            const Text("Shutter count:"),
            if (gear.note != "") const Text("Note:")
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(gear.serialNumber),
            Text("${gear.value} ${gear.valueCurrency}"),
            Text(properties['sensorSize']),
            Text("${properties['resolution']} MP"),
            Text(properties['shutterCount'].toString()),
            if (gear.note != "") Text(gear.note)
          ],
        ),
      ],
    );
  }

  Widget _getLensDetailsUi() {
    Map<String, dynamic> properties = jsonDecode(gear.properties);
    return Row(
      children: [
        Column(
          // List of keys
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Serial number:", textAlign: TextAlign.start),
            const Text("Value:", textAlign: TextAlign.start),
            const Text("Maximum aperture:", textAlign: TextAlign.start),
            const Text("Minimum aperture:", textAlign: TextAlign.start),
            const Text("Filter thread diameter:", textAlign: TextAlign.start),
            const Text("Image stabilization:"),
            if (gear.note != "") const Text("Note:")
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(gear.serialNumber),
            Text("${gear.value} ${gear.valueCurrency}"),
            Text("f/${properties['maximumAperture']}"),
            Text("f/${properties['minimumAperture']}"),
            Text("${properties['filterThreadDiameter']} mm"),
            Text(properties['hasImageStabilization']),
            if (gear.note != "") Text(gear.note)
          ],
        ),
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: gear.type == PhotoGearType.gearCamera ? _getCameraDetailsUi() : _getLensDetailsUi()
        ),
        Row(
          children: const [
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 5,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
