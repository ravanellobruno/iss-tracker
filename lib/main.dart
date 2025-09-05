import 'package:flutter/material.dart';
import 'components/menu.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const String appTitle = 'ISS (Estação Espacial Internacional)';

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            MyApp.appTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        drawer: Menu(onItemTapped: _onItemTapped, appTitle: MyApp.appTitle),
        body: routes[_selectedIndex].page,
      ),
    );
  }
}
