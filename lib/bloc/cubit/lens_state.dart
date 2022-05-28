part of 'lens_cubit.dart';

abstract class LensState extends Equatable {
  const LensState();
}

class LensInitial extends LensState {
  @override
  List<Object> get props => [];
}
