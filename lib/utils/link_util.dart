import 'package:url_launcher/url_launcher.dart';

class LinkUtil {
  static Future<void> openLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
