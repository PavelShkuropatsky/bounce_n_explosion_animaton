import 'package:bounce_n_explosion_animaton/bloc/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleCubit>(
      create: (context) => ToggleCubit(),
      child: BlocBuilder<ToggleCubit, ToggleState>(
        builder: (context, state) {
          return Ink(
            decoration: BoxDecoration(
              border: Border.all(color: state.color(), width: 10),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(300),
              onTap: ToggleCubit.of(context).toggle,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Icon(
                  state.icon(),
                  color: state.color(),
                  size: 150,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
