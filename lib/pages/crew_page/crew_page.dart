import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/loading.dart';
import '../../services/crew_service.dart';

class CrewPage extends StatefulWidget {
  final String title;
  final IconData icon;

  const CrewPage({super.key, required this.title, required this.icon});

  @override
  State<CrewPage> createState() => _CrewPageState();
}

class _CrewPageState extends State<CrewPage> {
  WebViewController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    final controller = await CrewService.createController(
      onPageStarted: (url) {
        setState(() {
          _isLoading = true;
        });
      },
      onPageFinished: (url) {
        setState(() {
          _isLoading = false;
        });
      },
    );

    setState(() {
      _controller = controller;
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
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste ',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Expanded(
                child:
                    _controller != null
                        ? WebViewWidget(controller: _controller!)
                        : const SizedBox(),
              ),
            ],
          ),
          if (_isLoading) const Loading(),
        ],
      ),
    );
  }
}
