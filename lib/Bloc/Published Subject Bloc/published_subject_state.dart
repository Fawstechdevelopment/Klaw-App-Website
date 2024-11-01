part of 'published_subject_bloc.dart';

@immutable
sealed class PublishedSubjectState {}

final class PublishedSubjectInitial extends PublishedSubjectState {}
class PublishedBlocLoading extends PublishedSubjectState {}
class PublishedBlocLoaded extends PublishedSubjectState {}
class PublishedBlocError extends PublishedSubjectState {}