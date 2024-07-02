import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.menu),
      onSelected: (int result) {
        switch (result) {
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('First Page'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Second Page'),
        ),
        const PopupMenuItem<int>(
          value: 3,
          child: Text('Third Page'),
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Center(
        child: Text('This is the main page'),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Center(
        child: Text('This is the first page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Center(
        child: Text('This is the second page'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: Center(
        child: Text('This is the third page'),
      ),
    );
  }
}
