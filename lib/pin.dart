import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart';
import 'package:manajemen_keuangan_psgede/menu.dart';

class PinMasuk extends StatefulWidget {
  const PinMasuk({Key? key}) : super(key: key);

  @override
  State<PinMasuk> createState() => _PinMasukState();
}

class _PinMasukState extends State<PinMasuk> {
  TextEditingController pin = TextEditingController();
  String pwpin = '661443';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Aplikasi\nManajemen Keuangan\nBursa Rasa',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
                height: 2),
          ),
          SizedBox(
            height: 0.1,
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: pin,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Masukkan PIN 6 Digit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print('Berhasil Masuk');
                if (pin.text == pwpin) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Selamat Datang'),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(title: 'Bursa Rasa')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Username atau Password salah'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text('LOG IN'),
            ),
          ),
        ],
      ),
    );
  }
}
