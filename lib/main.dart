import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/authentication/auth_repository.dart';
import 'package:flutter_starter/authentication/screens/login_creen.dart';
import 'package:flutter_starter/style/theme.dart' as theme_style;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Big Agent',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: const LoginScreen(),
      ),
    );
  }
}
