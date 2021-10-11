import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoeapp/models/sneaker.dart';

class APIService {
  /// Base URL
  static const _SNEAKER_API_URL = 'https://curs-flutter.herokuapp.com';

  /// Get all available sneakers.
  /// 
  /// Perform a GET request to `<api_url>/sneakers`.
  /// 
  /// *NOTE: Will return null if something fails.*
  static Future<List<Sneaker>?> getAllSneakers() async {
    final url = Uri.parse('$_SNEAKER_API_URL/sneakers');
    final res = await http.get(url);

    final json = jsonDecode(res.body);

    if (json['status'] != 'ok') {
      print('[API:FAIL] GET /sneakers failed with error: ${json['error']}');
      return null;
    }

    List<Sneaker> sneakers = [];

    (json['data'] as List<dynamic>).forEach((snkr) {
      sneakers.add(Sneaker.fromJson(snkr));
    });

    return sneakers;
  }

  /// Get more info about a sneaker (by it's [id])
  /// 
  /// Perform a GET request to `<api_url>/sneaker/[id]`.
  /// 
  /// *NOTE: Will return null if something fails.*
  static Future<Sneaker?> getSneakerByID(String id) async {
    final url = Uri.parse('$_SNEAKER_API_URL/sneaker/$id');
    final res = await http.get(url);

    final json = jsonDecode(res.body);

    if (json['status'] != 'ok') {
      print('[API:FAIL] GET /sneaker/$id failed with error: ${json['error']}');
      return null;
    }

    return Sneaker.fromJson(json['data']);
  }
}
