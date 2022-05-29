import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_photo_gear/data/db/data_source.dart';
import 'package:my_photo_gear/data/domain_model/photo_gear_base.dart';

part 'gear_cubit.g.dart';

class GearCubit extends Cubit<GearState> {
  final DataSource _dataSource;

  GearCubit(
    this._dataSource,
  ) : super(const Loading()) {
    getGear();
  }

  Future<void> getGear() async {
    _emitAllGear();
  }

  Future<void> upsertPhotoGear(PhotoGear gear) async {
    await _dataSource.updateOrInsertGear(gear);
    _emitAllGear();
  }

  Future<void> deletePhotoGear(PhotoGear gear) async {
    await _dataSource.deleteGear(gear);
    _emitAllGear();
  }

  Future<void> createPhotoGear(
      String make,
      String model,
      String serialNumber,
      int value,
      String valueCurrency,
      String note,
      PhotoGearType type,
      String properties) async {
    await _dataSource.updateOrInsertGear(
      PhotoGear(
          make: make,
          model: model,
          serialNumber: serialNumber,
          value: value,
          valueCurrency: valueCurrency,
          note: note,
          type: type,
          properties: properties),
    );
    _emitAllGear();
  }

  Future<void> _emitAllGear() async {
    final allGear = await _dataSource.getAllGear();
    emit(
      GearLoaded(gear: allGear),
    );
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
class GearLoaded extends Equatable implements GearState {
  final List<PhotoGear> gear;

  const GearLoaded({
    required this.gear,
  });

  @override
  List<Object> get props => [
        gear,
      ];
}
