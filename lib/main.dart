import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.orange),
  ));
}
