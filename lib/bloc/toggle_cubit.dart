import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(FinishToggleOff());

  startToggle() {
    if (state is ToggleOn) {
      emit(StartToggleOff());
    } else {
      emit(StartToggleOn());
    }
  }

  finishToggle() {
    if (state is StartToggleOn) {
      emit(FinishToggleOn());
    }
    else if (state is StartToggleOff) {
      emit(FinishToggleOff());
    }
  }

  static ToggleCubit of(BuildContext context) => context.read<ToggleCubit>();
}
