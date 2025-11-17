import 'package:flutter/material.dart';
import '../utils/link_util.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String url;

  const LinkText({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LinkUtil.openLink(url),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
