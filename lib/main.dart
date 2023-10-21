import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:interview_task/bloc/image_picker/pike_image_bloc.dart';
import 'package:interview_task/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:interview_task/bloc/theam_bloc/bloc/theam_bloc.dart';
import 'package:interview_task/themes/dark_theme.dart';
import 'package:interview_task/themes/light_theme.dart';

import 'package:interview_task/view/ui/registaion/registaion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<PikeImageBloc>(
          create: (context) => PikeImageBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state == ThemeMode.light ? lightTheme : darkTheme,
            themeMode: state,
            home: RegistationPage(),
          );
        },
      ),
    );
  }
}
