import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HowAreYouPage extends StatefulWidget {
  @override
  _HowAreYouPageState createState() => _HowAreYouPageState();
}

class _HowAreYouPageState extends State<HowAreYouPage> {
  bool isPlaying = true;
  late LottieComposition composition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Upper text "How are you?"
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              "Heggidiya?", //kannadaEng
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif', // You can add a classy font from Google Fonts
              ),
              textAlign: TextAlign.center,
            )),
            Text(
              "ಹೇಗಿದ್ದೀಯಾ?", //kannada
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif', // You can add a classy font from Google Fonts
              ),
              textAlign: TextAlign.center,
            ),
          // Middle Lottie animation
          Expanded(
            child: Center(
              child: Lottie.asset(
                'asset/greetings.json', // Add your Lottie animation file to assets
                animate: isPlaying,
                width: 350,
                height: 350,
              ),
            ),
          ),
          Text(
              "How are you?", //text
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif', // You can add a classy font from Google Fonts
              ),
              textAlign: TextAlign.center,
            ),
          
          // Bottom Play/Pause button
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: IconButton(
              iconSize: 80,
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
