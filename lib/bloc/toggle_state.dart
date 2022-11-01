part of 'toggle_cubit.dart';

@immutable
abstract class ToggleState {
  Color color();
  IconData icon();
}

class ToggleOn extends ToggleState {
  @override
  Color color() => Colors.red;
  @override
  IconData icon() => Icons.favorite;
}

class ToggleOff extends ToggleState {
  @override
  Color color() => Colors.black.withOpacity(0.8);
  @override
  IconData icon() => Icons.favorite_border_outlined;
}