import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/loading.dart';
import '../../components/no_data.dart';
import '../../components/intro_text.dart';
import '../../services/webview_service.dart';

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
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    const url = 'https://whoisinspace.com/';

    _controller = await WebViewService.createController(
      url: url,
      onPageStarted: (_) => setState(() => _isLoading = true),
      onPageFinished: (_) => setState(() => _isLoading = false),
      onWebResourceError: (_) => setState(() => _hasError = true),
    );

    if (mounted && WebViewService.isLoaded(url)) {
      setState(() => _isLoading = false);
    }
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: IntroText(
                  text:
                      'Role o frame para conhecer os astronautas que estão a bordo da ISS e também os da Tiangong (Estação Espacial Chinesa).',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child:
                      _hasError
                          ? const NoData()
                          : (_controller != null
                              ? WebViewWidget(controller: _controller!)
                              : const SizedBox()),
                ),
              ),
            ],
          ),
          if (_isLoading) const Loading(),
        ],
      ),
    );
  }
}
