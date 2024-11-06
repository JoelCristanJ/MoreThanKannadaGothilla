import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Lottie.asset('asset/Aniki Hamster.json'),
              //Lottie.asset('asset/Money.json'),
              const Text('Please wait while we Load the Content')
            ],
          ),
        ),
      ),
    );
  }
}