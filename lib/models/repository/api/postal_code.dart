import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final postalCodeProvider = Provider<PostalCode>((ref) => PostalCode());

abstract class BaseUserRepository {
  // 新規会員登録(FireStore)
  Future<Map<String, dynamic>?> fetchAddress({required String postalCode});
}

class PostalCode {
  Future<Map<String, dynamic>?> fetchAddress({required String postalCode}) async {
    final response = await http.get(Uri.parse('https://zip-cloud.appspot.com/api/search?zipcode=$postalCode'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}
