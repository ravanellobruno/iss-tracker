import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/loading.dart';
import '../../components/no_data.dart';
import '../../services/crew_service.dart';
import '../../utils/link_util.dart';

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
    _controller = await CrewService.createController(
      onPageStarted: (_) => setState(() => _isLoading = true),
      onPageFinished: (_) => setState(() => _isLoading = false),
      onWebResourceError: (_) => setState(() => _hasError = true),
    );
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
                child: Text(
                  'Role o frame para conhecer os astronautas que estão a bordo da ISS e também os da Tiangong (Estação Espacial Chinesa).',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Isto é um frame de: ',
                    style: TextStyle(fontSize: 14),
                  ),
                  InkWell(
                    onTap: () => LinkUtil.openLink('https://whoisinspace.com/'),
                    child: const Text(
                      'whoisinspace.com',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
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
