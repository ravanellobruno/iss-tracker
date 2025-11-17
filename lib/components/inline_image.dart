import 'package:flutter/material.dart';

class InlineImage extends StatelessWidget {
  final String path;

  const InlineImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 300, child: Image.asset(path)));
  }
}
