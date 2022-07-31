import 'package:flutter/material.dart';

import 'package:gtech1/models/photo_model.dart';
import 'package:gtech1/service/photo_service.dart';
import 'package:gtech1/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
