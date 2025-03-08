import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_relearning/bloc/auth_bloc.dart';
import 'package:flutter_bloc_relearning/login_screen.dart';
import 'package:flutter_bloc_relearning/widget/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.uid, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutRequest());
                    },
                  ),
                ],
              ),
            );
          }

          if (state is AuthFailure) {
            return Center(
              child: Text("Fehler: ${state.error}",
                  style: const TextStyle(color: Colors.red)),
            );
          }

          return const Center(child: Text("Bitte einloggen"));
        },
      ),
    );
  }
}
