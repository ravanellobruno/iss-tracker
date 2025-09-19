import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        'Dados não disponíveis no momento.',
        style: TextStyle(
          fontSize: 18,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
