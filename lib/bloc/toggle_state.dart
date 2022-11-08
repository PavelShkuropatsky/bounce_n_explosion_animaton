part of 'toggle_cubit.dart';

/// Base class of the toggle states
/// Provides to custom toggle button
/// - [icon]
/// - [color] for the icon
/// - [targetScale] on which the button is animates
@immutable
abstract class ToggleState {
  Color color();
  IconData icon();
  double targetScale();
}

abstract class ToggleOn extends ToggleState {
  @override
  Color color() => Colors.red;
  @override
  IconData icon() => Icons.favorite;
}

/// State comes first when the button toggles On
/// On this state button animates scale up to the [targetScale]
/// and the runs [FinishToggleOn] state
class StartToggleOn extends ToggleOn {
  @override
  double targetScale() => 0.85;
}

/// State comes after [StartToggleOn] when the button toggles On
/// On this state button animates scale down to the [targetScale]
class FinishToggleOn extends ToggleOn {
  @override
  double targetScale() => 1.0;
}

abstract class ToggleOff extends ToggleState {
  @override
  Color color() => Colors.black.withOpacity(0.8);
  @override
  IconData icon() => Icons.favorite_border_outlined;
}

/// State comes first when the button toggles Off
/// On this state button animates scale down to the [targetScale]
/// and the runs [FinishToggleOff] state
class StartToggleOff extends ToggleOff {
  @override
  double targetScale() => 0.85;
}

/// State comes after [StartToggleOff] when the button toggles Off
/// On this state button animates scale up to the [targetScale]
class FinishToggleOff extends ToggleOff {
  @override
  double targetScale() => 1.0;
}
