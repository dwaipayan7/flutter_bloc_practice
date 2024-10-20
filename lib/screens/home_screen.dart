import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text("Home Screen",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> ProductScreen()));
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            backgroundColor: Colors.blue, // Button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
          child: const Text(
            "Get Products",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }
}
