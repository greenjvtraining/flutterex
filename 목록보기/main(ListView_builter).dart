import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, item){
            print(item);
            return ListTile(
              leading: Image.asset(('assets/images/s_angry-bull.png')),
              title: Text('Test.....$item'),
              subtitle: Text('angry....'),
              trailing: Icon(Icons.more_vert),
            );
          },

        ),
      ),
    );
  }
}
