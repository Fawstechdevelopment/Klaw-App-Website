part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class FeatchContact extends ContactEvent {
  final String name;
  final String Email;
  final String Phonenumber;
  final String Feedback;

  FeatchContact({
    required this.name,
    required this.Email,
    required this.Phonenumber,
    required this.Feedback,
  });
}
