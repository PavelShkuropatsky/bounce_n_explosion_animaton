import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleOff());

  toggle() {
    if (state is ToggleOn) {
      emit(ToggleOff());
    } else {
      emit(ToggleOn());
    }
  }

  static ToggleCubit of(BuildContext context) => context.read<ToggleCubit>();
}
