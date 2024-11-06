import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'template.dart'; // Import the KannadaPageTemplate

class Everyday extends StatelessWidget {
  // List of pairs (Lottie animation paths and their corresponding text)
  final List<Map<String, String>> lottieItems = [
    {
      'animation': 'asset/greetings.json',
      'text': 'How are you?',
      'kannadaEng': 'Heggidiya?',
      'Kannada': 'ಹೇಗಿದ್ದೀಯ?',
    },
    {
      'animation': 'asset/name.json',
      'text': 'What is your name?',
      'kannadaEng': 'Ninna hesaru yenu?',
      'Kannada': 'ನಿನ್ನ ಹೆಸರು ಏನು?',
    },
    {
      'animation': 'asset/fine.json',
      'text': 'I am fine',
      'kannadaEng': 'Naanu chennagiddene',
      'Kannada': 'ನಾನು ಚೆನ್ನಾಗಿದ್ದೇನೆ',
    },
    {
      'animation': 'asset/whereareyou.json',
      'text': 'Where are you?',
      'kannadaEng': 'Nuu elli idiya?',
      'Kannada': 'ನೀವು ಎಲ್ಲಿ ಇದ್ದೀರಿ?',
    },
    {
      'animation': 'asset/looking.json',
      'text': 'What are you looking for?',
      'kannadaEng': 'Nivu enu hudukuttiddiri?',
      'Kannada': 'ನೀವು ಏನು ಹುಡುಕುತ್ತಿದ್ದೀರಿ?',
    },
    {
      'animation': 'asset/idea.json',
      'text': 'I have an Idea!',
      'kannadaEng': 'Nanagondu upāyavide!',
      'Kannada': 'ನನಗೊಂದು ಉಪಾಯವಿದೆ!',
    },
    {
      'animation': 'asset/music.json',
      'text': 'I am listening to music!',
      'kannadaEng': 'Nanu sangitavannu keluttiddene!',
      'Kannada': 'ನಾನು ಸಂಗೀತವನ್ನು ಕೇಳುತ್ತಿದ್ದೇನೆ!',
    },
    // Add more items as needed
  ];

  Everyday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Everyday"),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: lottieItems.length,
          itemBuilder: (context, index) {
            final item = lottieItems[index]; // Get the current pair
            return GestureDetector(
              onTap: () {
                // Navigate to KannadaPageTemplate
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KannadaPageTemplate(
                      pageData: PageData(
                        animation: item['animation']!,
                        text: item['text']!,
                        kannadaEng: item['kannadaEng']!,
                        kannada: item['Kannada']!,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      item['animation']!, // Load the corresponding Lottie file
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      item['text']!, // Show the corresponding text
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This is $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
