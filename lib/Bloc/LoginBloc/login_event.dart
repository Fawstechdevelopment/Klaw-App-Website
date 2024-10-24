part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class FeatchLogin extends LoginEvent {
  final String username;
  final String password;

  FeatchLogin({required this.username, required this.password  });
}