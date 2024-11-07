part of 'toggle_suject_bloc.dart';

@immutable
sealed class ToggleSujectEvent {}
class FeatchToggle extends ToggleSujectEvent {
  final String SubjectId;

  FeatchToggle({ required this.SubjectId});


}