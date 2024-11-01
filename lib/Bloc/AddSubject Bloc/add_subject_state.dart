part of 'add_subject_bloc.dart';

@immutable
sealed class AddSubjectState {}

final class AddSubjectInitial extends AddSubjectState {}
class AddSubjectBlocLoading extends AddSubjectState {}
class AddSubjectBlocLoaded extends AddSubjectState {}
class AddSubjectBlocError extends AddSubjectState {}