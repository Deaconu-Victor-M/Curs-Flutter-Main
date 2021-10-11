import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoeapp/models/sneaker.dart';

class APIService {
  static const SNEAKER_API_URL = 'https://curs-flutter.herokuapp.com';

  static Future<List<Sneaker>?> getAllSneakers() async {
    final url = Uri.parse('$SNEAKER_API_URL/sneakers');
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
}
