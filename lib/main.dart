import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:story_app_dicoding/features/auth/presentation/screens/auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/story/presentation/screens/story_screen.dart';
import 'package:story_app_dicoding/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MainApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MainApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MainApp({super.key, required this.sharedPreferences});

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
          home: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const AuthScreen(),
                  ),
                );
              } else if (state is AuthLoggedIn) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const StoryScreen(),
                  ),
                );
              } else if (state is AuthLoading) {
                showDialog(
                  context: context,
                  builder: (ctx) => const AlertDialog(
                    title: Text(
                      'Loading',
                      textAlign: TextAlign.center,
                    ),
                    content: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                );
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error.toString()),
                  ),
                );
              }
            },
            builder: (context, state) {
              final token = sharedPreferences.getString('token');
              context.read<AuthBloc>().add(OnAppOpened(token: token));

              if (token != null && state is Authenticated) {
                return const StoryScreen();
              } else {
                return const AuthScreen();
              }
            },
          )),
    );
  }
}
