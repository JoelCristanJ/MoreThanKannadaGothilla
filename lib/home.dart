import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:more_than_kannada_gothilla/directions.dart';
import 'package:more_than_kannada_gothilla/everyday.dart';
import 'package:more_than_kannada_gothilla/food.dart';
import 'package:more_than_kannada_gothilla/numbers.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _searchHistory = [];
  String _searchQuery = '';
  bool _isSearching = false;

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _endSearch() {
    if (_searchQuery.isNotEmpty) {
      setState(() {
        _searchHistory.add(_searchQuery);
        _searchQuery = '';
        _isSearching = false;
      });
    } else {
      setState(() {
        _isSearching = false;
      });
    }
  }

  // List of pairs (Lottie animation paths and their corresponding text and page)
  final List<Map<String, dynamic>> lottieItems = [
    {'animation': 'asset/greetings.json', 'text': 'Everyday', 'page': Everyday()},
    {'animation': 'asset/Directions.json', 'text': 'Directions', 'page': Directions()},
    {'animation': 'asset/Food.json', 'text': 'Food', 'page': Food()},
    {'animation': 'asset/Numbers.json', 'text': 'Numbers', 'page': Numbers()},
    // Add more pairs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                onChanged: _updateSearchQuery,
                onSubmitted: (_) => _endSearch(),
              )
            : const Text("MoreThanKannadaGothilla"),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              if (_isSearching) {
                _endSearch();
              } else {
                _startSearch();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_searchHistory.isNotEmpty)
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Recent Searches',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _searchHistory.length,
                      itemBuilder: (context, index) {
                        final term = _searchHistory[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text(term),
                            onDeleted: () {
                              setState(() {
                                _searchHistory.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: lottieItems.length,
                itemBuilder: (context, index) {
                  final item = lottieItems[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the page mapped to the grid item
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['page'],
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
                            item['animation']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['text']!,
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
          ),
        ],
      ),
    );
  }
}
