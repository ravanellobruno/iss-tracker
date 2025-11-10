import 'package:flutter/material.dart';
import 'components/menu.dart';
import 'routes/routes.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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

  void _onItemTapped(int i) {
    setState(() => _selectedIndex = i);
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
