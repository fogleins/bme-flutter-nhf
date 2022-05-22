import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/domain_model/camera.dart';

import '../../data/domain_model/lens.dart';

abstract class PhotoGearListItem {
  Widget buildTitle(BuildContext context);

  Widget buildContent(BuildContext context);
}

class CameraListItem implements PhotoGearListItem {
  final Camera camera;

  CameraListItem(this.camera);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Row(
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
                if (camera.note != "") const Text("Note:")
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(camera.serialNumber),
                Text("${camera.value} ${camera.valueCurrency}"),
                Text(camera.sensorSize.index == 0 ? "APS-C" : "FullFrame"),
                Text("${camera.resolution} MP"),
                Text(camera.shutterCount.toString()),
                if (camera.note != "") Text(camera.note)
              ],
            ),
          ],
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

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      "${camera.make} ${camera.model}",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class LensListItem implements PhotoGearListItem {
  final Lens lens;

  LensListItem(this.lens);

  @override
  Widget buildContent(BuildContext context) {
    return Column(
        children: [
          Row(
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
                  if (lens.note != "") const Text("Note:")
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lens.serialNumber),
                  Text("${lens.value} ${lens.valueCurrency}"),
                  Text("f/${lens.maximumAperture}"),
                  Text("f/${lens.minimumAperture}"),
                  Text("${lens.filterThreadDiameter} mm"),
                  Text(lens.hasImageStabilization ? "Yes" : "No"),
                  if (lens.note != "") Text(lens.note)
                ],
              ),
            ],
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

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      "${lens.make} ${lens.model} (${lens.minimumAperture == lens.maximumAperture ? "f/" + lens.maximumAperture.toString() : lens.maximumAperture.toString() + "-" + lens.minimumAperture.toString()})",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
