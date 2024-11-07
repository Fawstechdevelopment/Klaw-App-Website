part of 'toggle_suject_bloc.dart';

@immutable
sealed class ToggleSujectState {}

final class ToggleSujectInitial extends ToggleSujectState {}
class ToggleBlocLoading extends ToggleSujectState {}
class ToggleBlocLoaded extends ToggleSujectState {}
class ToggleBlocError extends ToggleSujectState {}