import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String title;

  const AboutPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
