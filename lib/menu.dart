import 'dart:html';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:manajemen_keuangan_psgede/mulai.dart';
import 'package:manajemen_keuangan_psgede/main.dart';
import 'package:manajemen_keuangan_psgede/menu.dart';

class daftarproduk extends StatelessWidget {
  const daftarproduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const numItems = 20;
    const _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Produk $idx',
          style: _biggerFont,
        ),
        //trailing: const Icon(Icons.dashboard),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}

class utama extends StatelessWidget {
  const utama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            //Icon( Icons.cloud, size: 64.0, color: Colors.teal),
            SizedBox(
              height: 25,
            ),
            Text(
              'Manajemen Keuangan\nBursa Rasa',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text('Mulai Hari'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MulaiHari1()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
//with SingleTickerProviderStateMixin
{
  static var _tabs = <Widget>[
    // *Note*: when changed child is of the same type as previous one, set the
    // key property explicitly.
    utama(),
    daftarproduk(),
    Icon(Icons.looks_one, size: 48, key: ValueKey(1)),
    Icon(Icons.looks_two, size: 48, key: ValueKey(2)),
    //Icon(Icons.looks_3, size: 48, key: ValueKey(3)),
  ];
  static const _btmNavbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black),
      label: 'Utama',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list, color: Colors.black),
      label: 'Daftar Produk',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history, color: Colors.black),
      label: 'Riwayat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings, color: Colors.black),
      label: 'Lainnya',
    ),
  ];
  int _currentTabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: _tabs[_currentTabIdx],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: _btmNavbarItems,
        currentIndex: _currentTabIdx,
        onTap: (idx) => setState(() => this._currentTabIdx = idx),
      ),
    );
  }
}
