import 'package:calculator/bloc/dark_mode_cubit.dart';
import 'package:calculator/widgets/app_app_bar.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(text: 'Theme'),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Text('Switch the theme of the app', textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0),),
          
          BlocBuilder<AppThemeCubit, bool>(
            builder: (context, state) => Switch(
              value: state, 
              onChanged: (value) {
                setState(  ()=> context.read<AppThemeCubit>().setMode(value)  );
              }
            ),
          ),
        ],
      ),
    );
  }
}
