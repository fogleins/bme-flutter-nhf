part of 'camera_cubit.dart';

abstract class CameraState extends Equatable {
  // todo: move to CameraCubit
  // final DataSource _dataSource;
  // final Camera? camera;
  //
  // const CameraState(this._dataSource, this.camera);
  const CameraState();
}

class CameraInitial extends CameraState {
  const CameraInitial();

  @override
  List<Object> get props => [];
}

class CameraCreateState extends CameraState {
  final Camera? camera;

  const CameraCreateState(this.camera);

  @override
  List<Object?> get props => [camera];
}

// used when editing
class CameraEditState extends CameraState {
  final Camera camera;

  const CameraEditState({
    required this.camera
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    camera
  ];
}
