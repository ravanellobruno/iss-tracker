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
            padding: EdgeInsets.only(right: 150, top: 35, bottom: 15),
            child: Image.asset('lib/assets/images/iss_emblem.png'),
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
