import 'package:flutter_bloc/flutter_bloc.dart';
part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(OnboardState()) {
    on<OnboardEvent>((event, emit) {
      emit(OnboardState(index: state.index));
    });
  }
}
