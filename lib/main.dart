import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_relearning/bloc/auth_bloc.dart';
import 'package:flutter_bloc_relearning/login_screen.dart';
import 'package:flutter_bloc_relearning/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Pallete.backgroundColor,
          ),
          home: const LoginScreen(),
        ));
  }
}
