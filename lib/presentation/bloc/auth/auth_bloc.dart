// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_app/domain/repositories/firebase_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);

    on<LogOutEvent>(_onLogOutEvent);
  }

  void _onLogOutEvent(LogOutEvent event, Emitter<AuthState> emit) async {
    final signOut = await repository.signOutWithGoogle();
    if (signOut) {
      emit(UnAutenticated());
      return;
    }

    emit(state);
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    final user = await repository.signInWithGoogle();

    if (user != null) {
      emit(Autenticated(user: user));
      return;
    }

    emit(UnAutenticated());
  }
}
