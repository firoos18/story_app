import 'package:flutter/material.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:story_app_dicoding/features/auth/presentation/screens/auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const AuthScreen(),
      ),
    );
  }
}
