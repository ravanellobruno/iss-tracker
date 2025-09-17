import 'package:webview_flutter/webview_flutter.dart';

class CrewService {
  static const String _url = 'https://whoisinspace.com/';

  static Future<WebViewController> createController({
    required void Function(String url) onPageStarted,
    required void Function(String url) onPageFinished,
  }) async {
    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: onPageStarted,
              onPageFinished: onPageFinished,
            ),
          )
          ..loadRequest(Uri.parse(_url));

    return controller;
  }
}
