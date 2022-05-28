import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/domain_model/camera.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  final DataSource _dataSource;
  // TODO: final Camera? camera?

  CameraCubit(this._dataSource) : super(const CameraInitial());

  Future<void> getCamera(int? id) async {
    if (id != null) {
      final camera = await _dataSource.getCamera(id);
      emit(CameraEditState(camera: camera));
    } else {
      Camera? camera;
      emit(CameraCreateState(camera));
    }
  }

  void addCamera() {
    var currentState = state;
    if (currentState is CameraEditState) return;

    if (currentState is CameraCreateState) {
      var camera = currentState.camera;
      // TODO...
    }
  }
}
