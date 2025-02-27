import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppAppBar({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 40.0,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.apps, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        if (Navigator.of(context).canPop())
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
