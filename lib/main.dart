import 'package:flutter/material.dart';
import 'package:test_work/widget/widget1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Test Example')),
        body: Center(child: MyWidget()),
      ),
    );
  }
}
