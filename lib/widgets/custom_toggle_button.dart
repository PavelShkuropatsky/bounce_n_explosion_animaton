import 'package:bounce_n_explosion_animaton/bloc/toggle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAnimatedToggleButton extends StatefulWidget {
  const CustomAnimatedToggleButton({super.key});

  @override
  State<CustomAnimatedToggleButton> createState() => _CustomAnimatedToggleButtonState();
}

class _CustomAnimatedToggleButtonState extends State<CustomAnimatedToggleButton> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleCubit>(
      create: (context) => ToggleCubit(),
      child: BlocBuilder<ToggleCubit, ToggleState>(
        builder: (context, state) {
          return CustomToggleButton(color: state.color(), icon: state.icon(), scale: state.targetScale(),);
        },
      ),
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double scale;

  const CustomToggleButton({super.key, required this.color, required this.icon, required this.scale,});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 10),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: ToggleCubit
            .of(context)
            .startToggle,
        child: Center(
          child: AnimatedScale(
              onEnd: () => ToggleCubit.of(context).finishToggle(),
              scale: scale,
              duration: const Duration(milliseconds: 50),
              filterQuality: FilterQuality.high,
              curve: Curves.easeInOutCubic,
              child: Icon(
                icon,
                color: color,
                size: 100,
              )),
        ),
      ),
    );
  }
}
