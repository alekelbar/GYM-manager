part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UnAutenticated extends AuthState {}

class Autenticated extends AuthState {
  final UserCredential user;

  const Autenticated({required this.user});
}
