import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());//run App
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Flutter Code Sample";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0; //상태 변수

  static const List<Widget> _widgetOptions = [
    Text(
      '0번째 : Home',
      style: TextStyle(fontSize:  40, fontWeight: FontWeight.bold),
    ),
    Text(
      '1번째 : Search',
      style: TextStyle(fontSize:  40, fontWeight: FontWeight.bold),
    ),
    Text(
      '2번째 : Profile',
      style: TextStyle(fontSize:  40, fontWeight: FontWeight.bold),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
        
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.grey[50],
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.indigo),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search', backgroundColor: Colors.deepOrange),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile', backgroundColor: Colors.deepPurple),
        ],
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}