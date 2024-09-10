import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(child: Text('Coyote Den V3 $title')),
        backgroundColor: const Color.fromARGB(171, 101, 33, 226),
        actions: [
          IconButton(
              onPressed: () =>
                  // nav to settings page
                  Navigator.pushNamed(context, '/settingsPage'),
              icon: const Icon(Icons.settings)),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
