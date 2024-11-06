import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// New Flutter page that generates a grid of Lottie animations and text
class Numbers extends StatelessWidget {
  // List of pairs (Lottie animation paths and their corresponding text)
  final List<Map<String, String>> lottieItems = [
    {'animation': 'asset/Greet.json', 'text': '1'},
    {'animation': 'asset/Dirns.json', 'text': '2'},
    {'animation': 'asset/Food.json', 'text': '3'},
    {'animation': 'asset/Page4.json', 'text': '4'},
    {'animation': 'asset/Page5.json', 'text': '5'},
    {'animation': 'asset/Page6.json', 'text': '6'},
    {'animation': 'asset/Page6.json', 'text': '7'},
    {'animation': 'asset/Page6.json', 'text': '8'},
    {'animation': 'asset/Page6.json', 'text': '9'},
    // Add more pairs as needed
  ];

  Numbers({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Grid Page"),
      ),
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
                // Handle tap event, navigate or show details if necessary
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item['text']!,
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
                    const SizedBox(height: 10),
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
