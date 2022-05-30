import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

part 'create_gear_cubit.g.dart';

class CreateGearCubit extends Cubit<CreateGearState> {
  final DataSource _dataSource;

  CreateGearCubit(this._dataSource) : super(const CreateGearState.initial());

  Future<void> submitGear(
      int? id,
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      PhotoGearType type,
      String properties) async {
    await _dataSource.updateOrInsertGear(
      state.gear.copyWith(
          id: id,
          make: make,
          model: model,
          serialNumber: serialNumber,
          value: value,
          valueCurrency: valueCurrency,
          note: note,
          type: type,
          properties: properties),
    );
  }

  void updateState(
      {int? id,
      String? make,
      String? model,
      String? serialNumber,
      int? value,
      String? valueCurrency,
      String? note,
      PhotoGearType? type,
      String? properties}) {
    emit(state.copyWith(
        gear: state.gear.copyWith(
            id: id,
            make: make,
            model: model,
            serialNumber: serialNumber,
            value: value,
            valueCurrency: valueCurrency,
            note: note,
            type: type,
            properties: properties)));
  }
}

@immutable
@CopyWith()
class CreateGearState extends Equatable {
  final PhotoGear gear;

  const CreateGearState({required this.gear});

  const CreateGearState.initial()
      : gear = const PhotoGear(
            id: null,
            make: "",
            model: "",
            serialNumber: "",
            value: -1,
            valueCurrency: "",
            note: "",
            type: PhotoGearType.gearCamera,
            properties: "");

  @override
  List<Object> get props => [
        gear,
      ];
}