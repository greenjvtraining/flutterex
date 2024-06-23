import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Scroll ex'),
        ),
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(50, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.blueAccent,
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }),
        ),
      ),
    ),
   ),
  )
 );//run App
}

