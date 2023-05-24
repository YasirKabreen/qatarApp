import 'package:flutter/material.dart';

import 'Account.dart';
import 'Maze.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int ix = 1;

  void methodIdex(int index, BuildContext ctx) {
    setState(() {
      ix = index;
    });
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return Maze();
      },
    ));
  }

  final List<Widget> navigate = [
    Account(),
    Maze(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.share),
        ],
        title: const Text('Qatar Home App'),
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: ix,
          onTap: (_) => methodIdex(1, context),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          ]),
    );
  }
}
