import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Lottie.asset('asset/ComingSoon.json'),
              //Lottie.asset('asset/Aniki Hamster.json'),
              //Lottie.asset('asset/Money.json'),
              const Text('This content is coming soon.')
            ],
          ),
        ),
      ),
    );
  }
}