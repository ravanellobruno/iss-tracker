import 'package:flutter/material.dart';
import '../../services/crew_service.dart';

class CrewPage extends StatefulWidget {
  final String title;
  final IconData icon;

  const CrewPage({super.key, required this.title, required this.icon});

  @override
  State<CrewPage> createState() => _CrewPageState();
}

class _CrewPageState extends State<CrewPage> {
  bool _hasFailed = false;
  String _scrapedData = 'Carregando...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final doc = await CrewService.getData();

    if (doc == null) {
      setState(() => _hasFailed = true);
      return;
    }

    final h1Tag = doc.getElementsByTagName('h1').first.text;

    setState(() {
      _scrapedData = h1Tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(widget.icon),
            const SizedBox(width: 8),
            Text(widget.title),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            _hasFailed
                ? const Text(
                  'Não foi possível carregar os dados. Tente novamente mais tarde.',
                  style: TextStyle(fontSize: 17),
                )
                : Text(_scrapedData, style: const TextStyle(fontSize: 17)),
      ),
    );
  }
}
