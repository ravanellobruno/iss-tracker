import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

class CrewService {
  static const String _url = 'https://whoisinspace.com/';

  static Future<Document?> getData() async {
    try {
      final res = await http
          .get(Uri.parse(_url))
          .timeout(const Duration(seconds: 6));

      if (res.statusCode != 200) {
        return null;
      }

      return parser.parse(res.body);
    } catch (_) {
      return null;
    }
  }
}
