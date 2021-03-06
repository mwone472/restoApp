// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restoapp/pages/splash_view.dart';
import 'package:restoapp/util/restaurants.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  addProduct();
  runApp(MyApp());
}
// 24/12/2020
//25/12/2020

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
