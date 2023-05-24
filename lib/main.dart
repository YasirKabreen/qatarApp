import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qatar_app/provider.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvLists(),
      child: MaterialApp(
        title: 'Qatar',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
