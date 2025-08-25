import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../credientials/api_creds.dart';
import 'exception.dart';

class ApiProvider {
  Future<dynamic> get(String url, Map<String, String> map) async {
    var mapHeader = {
      'Accept': 'application/json',
    };

    try {
      var uri = Uri.https(BaseUrl, '$PathExtender$url', map);
      debugPrint('request: $uri $url -$mapHeader');
      final response = await http.get(uri, headers: mapHeader);
      debugPrint('response: $uri $url - $map ${response.body}');
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }
  Future<dynamic> post(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? params}) async {
    var mapHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      var uri = Uri.https(BaseUrl, '$PathExtender$url', params);
      debugPrint('request: $uri $url -$mapHeader - ${jsonEncode(body)} ');
      final response = await http.post(uri, body: jsonEncode(body), headers: mapHeader);
      debugPrint('response: $uri $url - $body ${response.body}');
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on http.ClientException catch (e) {
      throw FetchDataException('Error: ${e.message}');
    }
  }


  /// Add more methods as needed for PUT, DELETE, etc.






  dynamic _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 404:
        throw InvalidInputException(response.body);
      case 400:
        throw FetchDataException(response.body);
      case 401:
        throw UnauthorisedException('Unauthorized access. Redirecting to login.');
      default:
        throw FetchDataException(response.body);
    }
  }
}