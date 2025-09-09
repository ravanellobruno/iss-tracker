import 'dart:convert';
import 'package:http/http.dart' as http;

class IssService {
  static const String _url = 'https://api.wheretheiss.at/v1/satellites/25544';

  static Future<Map<String, dynamic>?> getPosition() async {
    try {
      final res = await http
          .get(Uri.parse(_url))
          .timeout(const Duration(seconds: 6));

      if (res.statusCode != 200) {
        return null;
      }

      return jsonDecode(res.body) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }
}
