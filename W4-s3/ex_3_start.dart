import 'package:flutter/material.dart';

const String IMG1 = 'w4-s2/bird.jpg'; 
const String IMG2 = 'w4-s2/bird2.jpg'; 
const String IMG3 = 'w4-s2/insect.jpg'; 
const String IMG4 = 'w4-s2/girl.jpg'; 
const String IMG5 = 'w4-s2/man.jpg'; 

List<String> images = [
IMG1,
IMG2,
IMG3,
IMG4,
IMG5
];


void main() => runApp(MaterialApp(
      home: ImageGallery(),
    ));

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;

  void _showNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  void _showPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.navigate_before),
                tooltip: 'Go to the previous image',
                onPressed: _showPreviousImage,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: IconButton(
                      icon: const Icon(Icons.navigate_next),
                      tooltip: 'Go to the next image',
                      onPressed: _showNextImage,
                  ),
              ),
          ],
      ),
      body: Center(
        child: Image.asset(images[_currentIndex]),
      ),
    );
  }
}
