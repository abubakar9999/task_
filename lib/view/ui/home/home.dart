import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/theam_bloc/bloc/theam_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Switch(
                value:
                    context.select((ThemeBloc themeBloc) => themeBloc.state) ==
                        ThemeMode.dark,
                onChanged: (value) {
                  context
                      .read<ThemeBloc>()
                      .add(TheamChangeEvent(isDark: value));
                })
          ],
        ),
      ),
      body: Column(),
    );
  }
}
