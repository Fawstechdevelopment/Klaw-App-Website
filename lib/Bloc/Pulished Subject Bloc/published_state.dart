part of 'published_bloc.dart';

@immutable
sealed class PublishedState {}

final class PublishedInitial extends PublishedState {}
class PublishedBlocLoading extends  PublishedState {}
class PublishedBlocLoaded extends  PublishedState {}
class PublishedBlocError extends  PublishedState {}