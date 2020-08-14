import 'package:escolasabatina/pages/home.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const String START_URL = 'https://mais.cpb.com.br/licao-adultos/';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
