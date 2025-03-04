import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginrequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        if (password.length < 6) {
          return emit(AuthFailure(error: "Passwort zu kurz"));
        }

        await Future.delayed(Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: "$email-$password"));
        });
      } catch (e) {
        return emit(AuthFailure(error: "Login fehlgeschlagen"));
      }
    });
  }
}
