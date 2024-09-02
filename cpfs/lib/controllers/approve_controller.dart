import 'dart:convert';

import 'package:cpfs/components/status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> approveLoan(BuildContext context, int loanId) async {
  final body = {
    'loan_id': loanId,
  };

  const url = 'https://bo-uat.htfs.co.zw/api/ceo/loans/approve';
  final uri = Uri.parse(url);

  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print('No token found.');
      // Return an empty map or an error message map
      return {'error': 'No token found'};
    }

    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        "Content-Type": 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      showMessage(context, "Loan successfully approved", "Success");
      print('Response data: ${response.body}');
      // Return the response body as a parsed map
      return jsonDecode(response.body);
    } else {
      showMessage(
        context,
        'Failed to submit data. Status code: ${response.statusCode}\nResponse body: ${response.body}',
        'Error',
      );
      print(
        'Failed to submit data. Status code: ${response.statusCode}\nResponse body: ${response.body}',
      );
      // Return a map indicating an error
      return {
        'error': 'Failed to submit data',
        'statusCode': response.statusCode,
        'responseBody': response.body,
      };
    }
  } catch (e) {
    if (context.mounted) {
      showMessage(context, 'An error occurred: $e', 'Error');
    } else {
      // Fallback action if context is not mounted
      print('An error occurred and context is not mounted: $e');
    }
    print('An error occurred: $e');
    // Return a map indicating an exception
    return {'error': 'An error occurred', 'exception': e.toString()};
  }
}
