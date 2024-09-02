import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchLoans() async {
  const url = 'https://bo-uat.htfs.co.zw/api/ceo/loans';
  final uri = Uri.parse(url);

  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print('no token found ');

      return [];
    }
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> loans = data['loans']['data'];
      print(loans);
      return loans;
    } else {
      print('Failed to fetch loans. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  } catch (e) {
    print('An error occurred: $e');
    return [];
  }
}
