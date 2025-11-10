import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../components/loading.dart';
import '../../components/no_data.dart';
import '../../services/model_3d_service.dart';
import '../../utils/link_util.dart';

class Model3dPage extends StatefulWidget {
  final String title;
  final IconData icon;

  const Model3dPage({super.key, required this.title, required this.icon});

  @override
  State<Model3dPage> createState() => _Model3dPageState();
}

class _Model3dPageState extends State<Model3dPage> {
  WebViewController? _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    _controller = await Model3dService.createController(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              children: [
                const Text(
                  'Arraste para a direita ou esquerda e segure para rotacionar. Você também pode aproximar ou afastar.',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Isto é um frame de: ',
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap:
                          () => LinkUtil.openLink(
                            'https://solarsystem.nasa.gov/gltf_embed/2378/',
                          ),
                      child: const Text(
                        'solarsystem.nasa.gov',
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
                SizedBox(
                  height: 450,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
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
          ),
          if (_isLoading) const Loading(),
        ],
      ),
    );
  }
}
