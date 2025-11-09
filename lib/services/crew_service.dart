import 'package:webview_flutter/webview_flutter.dart';

class CrewService {
  static const String _url = 'https://whoisinspace.com/';

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
