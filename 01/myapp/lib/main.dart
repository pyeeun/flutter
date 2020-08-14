import 'package:flutter/material.dart';
import 'package:myapp/main_page.dart';

void main() => runApp(StatelessApp());

class StatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapp',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.blueGrey,
      ),
      home: StatelessPage(),
    );
  }
}
