// import 'package:copy_with_extension/copy_with_extension.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../data/db/data_source.dart';
// import '../data/domain_model/camera.dart';
//
// part 'camera_details_cubit.g.dart';
//
// class CameraDetailsCubit extends Cubit<CameraState> {
//   final DataSource _dataSource;
//
//   CameraDetailsCubit(
//     this._dataSource,
//     int? id,
//   ) : super(const Loading()) {
//     if (id != null) {
//       getCamera(id);
//     } else {
//       // create a dummy camera that can be edited
//       Camera camera = Camera(
//           make: "",
//           model: "",
//           serialNumber: "",
//           value: -1,
//           note: "",
//           sensorSize: SensorSize.apsC,
//           resolution: -1,
//           shutterCount: -1,
//           valueCurrency: "");
//       emit(CameraLoaded(camera: camera));
//     }
//   }
//
//   Future<void> getCamera(int id) async {
//     final camera = await _dataSource.getCamera(id);
//     emit(
//       CameraLoaded(camera: camera),
//     );
//   }
// }
//
// @immutable
// abstract class CameraState {}
//
// @immutable
// class Loading implements CameraState {
//   const Loading();
// }
//
// @immutable
// @CopyWith()
// class CameraLoaded extends Equatable implements CameraState {
//   final Camera camera;
//
//   const CameraLoaded({
//     required this.camera,
//   });
//
//   @override
//   List<Object> get props => [
//         camera,
//       ];
// }
