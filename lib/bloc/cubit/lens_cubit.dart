import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lens_state.dart';

class LensCubit extends Cubit<LensState> {
  LensCubit() : super(LensInitial());
}
