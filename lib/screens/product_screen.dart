import 'package:flutter/material.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
      body: ListView.builder(
          itemBuilder: (context, index){
            return ListTile(

            );
          }
      )
    );
  }
}
