import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Define the structure of your data
class PageData {
  final String animation;
  final String text;
  final String kannadaEng;
  final String kannada;

  PageData({
    required this.animation,
    required this.text,
    required this.kannadaEng,
    required this.kannada,
  });
}

// Example page template to display KannadaEng, Kannada, animation, and text
class KannadaPageTemplate extends StatefulWidget {
  final PageData pageData;

  const KannadaPageTemplate({super.key, required this.pageData});

  @override
  _KannadaPageTemplateState createState() => _KannadaPageTemplateState();
}

class _KannadaPageTemplateState extends State<KannadaPageTemplate> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Upper Kannada-English text
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              widget.pageData.kannadaEng, // KannadaEng text
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif', // Add a classy font from Google Fonts
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Kannada text
          Text(
            widget.pageData.kannada, // Kannada text
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
            textAlign: TextAlign.center,
          ),
          // Middle Lottie animation
          Expanded(
            child: Center(
              child: Lottie.asset(
                widget.pageData.animation, // Animation path from assets
                animate: isPlaying,
                width: 350,
                height: 350,
              ),
            ),
          ),
          // English text
          Text(
            widget.pageData.text, // English text
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
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