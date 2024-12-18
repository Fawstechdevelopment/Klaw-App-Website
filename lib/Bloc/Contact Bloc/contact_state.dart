part of 'contact_bloc.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}
class ContactBlocLoading extends  ContactState {}
class ContactBlocLoaded extends  ContactState {}
class ContactBlocError extends  ContactState {}