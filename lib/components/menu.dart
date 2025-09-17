import 'package:flutter/material.dart';
import '../routes/routes.dart';

class Menu extends StatelessWidget {
  final Function(int) onItemTapped;
  final String appTitle;

  const Menu({super.key, required this.onItemTapped, required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(appTitle, style: const TextStyle(fontSize: 16)),
          ),
          ...List.generate(routes.length, (i) {
            final route = routes[i];

            return ListTile(
              leading: Icon(route.icon),
              title: Text(route.label),
              onTap: () {
                Navigator.pop(context);
                onItemTapped(i);
              },
            );
          }),
        ],
      ),
    );
  }
}
