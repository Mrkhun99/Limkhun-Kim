import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

// A list of jokes (title and description)
final List<Map<String, String>> jokes = List.generate( 10,
  (index) => {
    'title': 'Hello Guys $index',
    'description': 'Welcome to Helloworld $index.',
  },
);

void main() => runApp(const FavoriteJokesApp());

class FavoriteJokesApp extends StatelessWidget {
  const FavoriteJokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Joker"),
        ),
        body: const JokeList(),
      ),
    );
  }
}

class JokeList extends StatefulWidget {
  const JokeList({super.key});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? _favoriteIndex; // Index of the favorite joke

  void setFavorite(int index) {
    setState(() {
      _favoriteIndex = (_favoriteIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          title: jokes[index]['title']!,
          description: jokes[index]['description']!,
          isFavorite: _favoriteIndex == index,
          onFavoriteClick: () => setFavorite(index),
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
