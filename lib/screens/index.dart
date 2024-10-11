import 'package:flutter/material.dart';
import 'package:todolist_app/components/home_button.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Set opacity for the background image
              child: Image.asset(
                'assets/images/background3.jpg', // Your background image path
                fit: BoxFit.cover, // Ensures the image covers the entire background
              ),
            ),
          ),
          // Content of the Scaffold
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 200, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeButton(imagePath: 'assets/images/button1.jpg', title: 'Home'),
                    HomeButton(imagePath: 'assets/images/button2.jpg', title: 'Search'),
                    HomeButton(imagePath: 'assets/images/button3.jpg', title: 'Your favorite'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeButton(imagePath: 'assets/images/button4.jpg', title: 'Publish work'),
                    HomeButton(imagePath: 'assets/images/button5.jpg', title: 'Your gallery'),
                    HomeButton(imagePath: 'assets/images/button6.jpg', title: 'Setting'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
