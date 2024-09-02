import 'dart:convert';

import 'package:cpfs/components/bottom_navigation.dart';
import 'package:cpfs/components/status_dialog.dart';
import 'package:cpfs/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(
    BuildContext context,
    TextEditingController passwordController,
    TextEditingController usernameController) async {
  final password = passwordController.text;
  final phone = usernameController.text;

  final body = {"phone": phone, "password": password};

  const url = 'https://bo-uat.htfs.co.zw/api/ceo/login';

  final uri = Uri.parse(url);

  try {
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        "Content-Type": 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // print('the token is' + token);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false,
      );

      print('Response data: ${response.body}');
    } else {
      showMessage(
        context,
        'Failed to submit data. Status code: ${response.statusCode}\nResponse body: ${response.body}',
        'Error',
      );
      print(
        'Failed to submit data. Status code: ${body}\nResponse body: ${response.body}',
      );
    }
  } catch (e) {
    showMessage(context, 'An error occurred: $e', 'Error');
    print('An error occurred: $e');
  }
}
