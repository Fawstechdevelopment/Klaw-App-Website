part of 'draft_subject_bloc.dart';

@immutable
sealed class DraftSubjectState {}

final class DraftSubjectInitial extends DraftSubjectState {}
class DraftSubjectBlocLoading extends DraftSubjectState {}
class DraftSubjectBlocLoaded extends DraftSubjectState {}
class DraftSubjectBlocError extends DraftSubjectState {}