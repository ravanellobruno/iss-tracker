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
        const Divider(),
        SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        SizedBox(height: 7),
        Text(description),
        SizedBox(height: 4),
      ],
    );
  }
}
