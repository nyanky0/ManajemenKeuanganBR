import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:manajemen_keuangan_psgede/mulai.dart';
import 'package:manajemen_keuangan_psgede/main.dart';
import 'package:manajemen_keuangan_psgede/menu.dart';
import 'package:firebase_core/firebase_core.dart';

class MulaiHari1 extends StatefulWidget {
  const MulaiHari1({Key? key}) : super(key: key);

  @override
  State<MulaiHari1> createState() => _MulaiHari1State();
}

class _MulaiHari1State extends State<MulaiHari1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('A'),
    ));
  }
}
