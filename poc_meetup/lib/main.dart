import 'package:flutter/material.dart';
import 'package:poc_meetup/home/homepage_one.dart';
import 'package:poc_meetup/home/homepage_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'In Companies'),
    );
  }
}
