import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:flutter/foundation.dart';

import '../data/domain_model/camera.dart';
import '../data/domain_model/lens.dart';

class GearCubit extends Cubit<GearState> {
  final DataSource _dataSource;

  GearCubit(
      this._dataSource
      ) : super(const Loading()) {
    getCameras();
  }

  Future<void> getCameras() async {
    _emitAllGear();
  }

  Future<void> updateOrInsertCamera(Camera camera) async {
    await _dataSource.updateOrInsertCamera(camera);
    _emitAllGear();
  }

  Future<void> deleteCamera(Camera camera) async {
    await _dataSource.deleteCamera(camera);
    _emitAllGear();
  }

  Future<void> createCamera(
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      SensorSize sensorSize,
      double resolution,
      int shutterCount
      ) async {
    await _dataSource.updateOrInsertCamera(Camera(
      make: make,
      model: model,
      serialNumber: serialNumber,
      value: value,
      valueCurrency: valueCurrency,
      note: note,
      sensorSize: sensorSize,
      resolution: resolution,
      shutterCount: shutterCount
    )
    );
    _emitAllGear();
  }

  Future<void> _emitAllGear() async {
    final allCameras = await _dataSource.getAllCameras();
    final allLenses = await _dataSource.getAllLenses();

    emit(AllGearLoaded(cameras: allCameras, lenses: allLenses));
  }
}

@immutable
abstract class GearState {}

@immutable
class Loading implements GearState {
  const Loading();
}

@immutable
@CopyWith()
class AllGearLoaded extends Equatable implements GearState {
  final List<Camera> cameras;
  final List<Lens> lenses;

  const AllGearLoaded({
    required this.cameras,
    required this.lenses
});

  @override
  List<Object> get props => [
    cameras,
    lenses
  ];
}