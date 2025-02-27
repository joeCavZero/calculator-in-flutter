import 'package:calculator/bloc/dark_mode_cubit.dart';
import 'package:calculator/views/calculator_page.dart';
import 'package:calculator/views/home_page.dart';
import 'package:calculator/views/preferences_page.dart';
import 'package:calculator/views/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, bool>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: ThemeData(
            primaryColor: Colors.amber,
            brightness: state ? Brightness.dark : Brightness.light,
          ),
          routes: {
            '/calculator': (context) => CalculatorPage(),
            '/home': (context) => HomePage(),
            '/preferences': (context) => PreferencesPage(),
            '/preferences/theme': (context) => ThemePage(),
          },
          initialRoute: '/calculator',
        ),
      ),
    );
  }
}