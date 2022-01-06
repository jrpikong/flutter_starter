import 'package:flutter/foundation.dart';

class AuthRepository {
  Future<void> login() async {
    if (kDebugMode) {
      print('attempting login');
    }
    await Future.delayed(const Duration(seconds: 1));
    if (kDebugMode) {
      print('logged in');
    }
    // throw Exception('failed log in');
  }
}