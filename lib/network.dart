import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Network extends StatelessWidget {
  const Network({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Lottie.asset('asset/Network.json'),
              const Text('No Network Found'),
              const Text("Please check your internet connection")
            ],
          ),
        ),
      ),
    );
  }
}