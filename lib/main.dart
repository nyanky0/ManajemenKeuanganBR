import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:manajemen_keuangan_psgede/mulai.dart';
import 'package:manajemen_keuangan_psgede/main.dart';
import 'package:manajemen_keuangan_psgede/menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manajemen Keuangan Bursa Rasa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Bursa Rasa'),
    );
  }
}

