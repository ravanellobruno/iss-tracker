import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final Function() onCentralize;

  const TopBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onCentralize,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: onCentralize,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
