part of 'delete_bloc.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}
class DeleteBlocLoading extends DeleteState {}
class DeleteBlocLoaded extends DeleteState {}
class DeleteBlocError extends DeleteState {}