import 'package:flutter/material.dart';

class MainDataRow extends StatelessWidget {
  final String label;
  final String value;
  final String description;

  const MainDataRow({
    super.key,
    required this.label,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(value),
          ],
        ),
        Text(description),
        const Divider(),
      ],
    );
  }
}
