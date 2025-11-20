import 'package:webview_flutter/webview_flutter.dart';

class WebViewService {
  static final Map<String, WebViewController> _cachedControllers = {};
  static final Map<String, bool> _isLoaded = {};
  static bool isLoaded(String url) => _isLoaded[url] ?? false;

  static Future<WebViewController> createController({
    required String url,
    required void Function(String) onPageStarted,
    required void Function(String) onPageFinished,
    required void Function(WebResourceError) onWebResourceError,
  }) async {
    if (_cachedControllers.containsKey(url)) {
      return _cachedControllers[url]!;
    }

    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: onPageStarted,
              onPageFinished: (u) {
                _isLoaded[url] = true;
                onPageFinished(u);
              },
              onWebResourceError: onWebResourceError,
            ),
          )
          ..loadRequest(Uri.parse(url));

    _cachedControllers[url] = controller;

    return controller;
  }
}
