import 'package:flutter/material.dart';

class Model3dPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const Model3dPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(icon), const SizedBox(width: 8), Text(title)],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            'teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
