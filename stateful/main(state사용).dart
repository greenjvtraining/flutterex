import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //state는 변하면 state를 사용하는 모든 위젯이 자동으로 재랜더링됨.
  //언제 쓰나 ? 자주 바뀌는 데이터, 바뀌면 바로 적용되어야 하는 것들
  var a = 1; // Stateful위젯에 변수를 선언하면 state가 된다.
  var title = '연락처앱';
  var name = ['홍길동', '일지매', '강백호'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() { //state를 재설정하는 곳
              a++;
            });
          },
        ),
        appBar: AppBar(
          title: Text(
            title,
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
              title: Text('Test.....$item' + name[item]),
              subtitle: Text(name[item]),
              trailing: Icon(Icons.more_vert),
            );
          },

        ),
      ),
    );
  }
}
