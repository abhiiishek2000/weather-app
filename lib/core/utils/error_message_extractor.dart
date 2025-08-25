import 'dart:convert';

class ErrorMessageExtractor {
  static String call(String res) {
    try {
      final failRes = json.decode(res);
      if (failRes is Map<String, dynamic> && failRes.containsKey('message')) {
        return failRes['message'];
      }

      return res.toString();
    } catch (e) {
      return res;
    }
  }
}
