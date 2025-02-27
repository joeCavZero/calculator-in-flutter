import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Calculator',
              style: TextStyle(
                fontSize: 40.0,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          if (ModalRoute.of(context)?.settings.name != '/home')
          ListTile(
            title: Text('Home'),
            onTap: () {

              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            },
          ),
          if (ModalRoute.of(context)?.settings.name != '/calculator')
          ListTile(
            title: Text('Calculator'),
            onTap: () {
              Navigator.of(context).pushNamed('/calculator');
            },
          ),
          if (ModalRoute.of(context)?.settings.name != '/preferences')
          ListTile(
            title: Text('Preferences'),
            onTap: () {
              Navigator.of(context).pushNamed('/preferences');
            },
          ),
        ],
      ),
    );
  }
}