// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/index.dart';

class HomeButton extends StatefulWidget {
  final String imagePath;
  final String title;

  const HomeButton({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  bool _isHovered = false; // To track hover state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Index()),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Container(
          width: 200,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
             // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRect( // Clip the image to avoid overflow
                child: AnimatedScale(
                  scale: _isHovered ? 1.1 : 1.0, // Zoom effect
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedOpacity(
                    opacity: _isHovered ? 0.7 : 1.0, // Change opacity on hover
                    duration: const Duration(milliseconds: 200),
                    child: SizedBox(
                      height: 150, // Image container height
                      width: double.infinity, // Make it fill the available width
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover, // Ensure the image covers the space
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.title,
                    style: ButtonText2, // Ensure ButtonText2 is defined in constant.dart
                    textAlign: TextAlign.center, // Center the text
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
