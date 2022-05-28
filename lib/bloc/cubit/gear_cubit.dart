import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gear_state.dart';

class GearCubit extends Cubit<GearState> {
  GearCubit() : super(GearInitial());
}
