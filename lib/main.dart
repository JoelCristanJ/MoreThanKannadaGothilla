import 'package:flutter/material.dart';
import 'package:more_than_kannada_gothilla/bottombar.dart';
import 'package:more_than_kannada_gothilla/everyday.dart';
import 'package:more_than_kannada_gothilla/food.dart';
import 'package:more_than_kannada_gothilla/home.dart';
import 'package:more_than_kannada_gothilla/loading.dart';
import 'package:more_than_kannada_gothilla/network.dart';
import 'package:more_than_kannada_gothilla/phrasePage.dart';
import 'package:more_than_kannada_gothilla/profile.dart';
import 'package:more_than_kannada_gothilla/testYourself.dart';
import 'login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      //home: Loading(),
      //home: Network(),
      //home: Food()
      //home: Profile(),
      //home: HowAreYouPage(),
      //home: Everyday(),
      //home: Test(),
      home: MyApp()
    );
  }
}