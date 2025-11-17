import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  final String text;

  const IntroText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
