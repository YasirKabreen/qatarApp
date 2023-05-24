import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qatar_app/mazeItem.dart';
import 'package:intl/intl.dart';
import 'package:qatar_app/provider.dart';

import 'ItemList.dart';
import 'TotalBox.dart';

class Maze extends StatefulWidget {
  const Maze({Key? key}) : super(key: key);

  @override
  State<Maze> createState() => _MazeState();
}

class _MazeState extends State<Maze> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProvLists>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('الميز الشهري'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              TotalBox(),
              const Divider(height: 20),
              ItemList(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
