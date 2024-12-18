part of 'editing_subject_bloc.dart';

@immutable
sealed class EditingSubjectState {}

final class EditingSubjectInitial extends EditingSubjectState {}
class EditingSubjectBlocLoading extends EditingSubjectState {}
class EditingSubjectBlocLoaded extends EditingSubjectState {}
class EditingSubjectBlocError extends EditingSubjectState {}