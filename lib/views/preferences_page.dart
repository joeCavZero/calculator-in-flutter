import 'package:calculator/widgets/app_app_bar.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(text: 'preferences'),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/preferences/theme');
            },
          ),
        ],
      ),
    );
  }
}