import 'package:flutter/material.dart';
import 'package:poc_meetup/home/triple/homepage_triple.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePageTriple(title: 'In Companies'),
    );
  }
}
