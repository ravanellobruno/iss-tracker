import 'package:webview_flutter/webview_flutter.dart';

class Model3dService {
  static const String _url = 'https://solarsystem.nasa.gov/gltf_embed/2378/';

  static Future<WebViewController> createController({
    required void Function(String) onPageStarted,
    required void Function(String) onPageFinished,
    required void Function(WebResourceError) onWebResourceError,
  }) async {
    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: onPageStarted,
              onPageFinished: onPageFinished,
              onWebResourceError: onWebResourceError,
            ),
          )
          ..loadRequest(Uri.parse(_url));

    return controller;
  }
}
