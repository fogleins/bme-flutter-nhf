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
    return const Text("unimplemented"); // todo: content kitöltése több sorban?
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
    // TODO: implement buildContent
    return const Text("unimplemented");
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      "${lens.make} ${lens.model} (${lens.minimumAperture == lens.maximumAperture ? "f/" + lens.maximumAperture.toString() : lens.maximumAperture.toString() + "-" + lens.minimumAperture.toString()})",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
