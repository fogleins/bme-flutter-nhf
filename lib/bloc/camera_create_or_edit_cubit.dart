import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/data/db/data_source.dart';

import '../data/domain_model/camera.dart';

part 'camera_create_or_edit_cubit.g.dart';

class CreateOrEditCameraCubit extends Cubit<CreateOrEditCameraState> {
  final DataSource _dataSource;

  CreateOrEditCameraCubit(
    this._dataSource,
  ) : super(CreateOrEditCameraState.initial());

  Future<void> submitCamera(
      int? id,
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      SensorSize sensorSize,
      double resolution,
      int shutterCount) async {
    await _dataSource.updateOrInsertCamera(state.camera.copyWith(
        id: id,
        make: make,
        model: model,
        serialNumber: serialNumber,
        value: value,
        valueCurrency: valueCurrency,
        note: note,
        sensorSize: sensorSize,
        resolution: resolution,
        shutterCount: shutterCount));
  }

  void updateState(
      {int? id,
      required String make,
      required String model,
      required String serialNumber,
      required int value,
      required String valueCurrency,
      required String note,
      required SensorSize sensorSize,
      required double resolution,
      required int shutterCount}) {
    emit(state.copyWith(
        camera: state.camera.copyWith(
            id: id,
            make: make,
            model: model,
            serialNumber: serialNumber,
            value: value,
            valueCurrency: valueCurrency,
            note: note,
            sensorSize: sensorSize,
            resolution: resolution,
            shutterCount: shutterCount)));
  }
}

@immutable
@CopyWith()
class CreateOrEditCameraState extends Equatable {
  final Camera camera;

  const CreateOrEditCameraState({required this.camera});

  CreateOrEditCameraState.initial()
      : camera = Camera(
            id: null,
            make: "",
            model: "",
            serialNumber: "",
            value: -1,
            valueCurrency: "",
            note: "",
            sensorSize: SensorSize.apsC,
            resolution: -1,
            shutterCount: -1);

  @override
  List<Object> get props => [camera];
}
