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
  var like_cnt = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

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
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(('assets/images/s_angry-bull.png')),
                  SizedBox(width: 8), // 이미지와 텍스트 사이의 간격
                  Text(like_cnt[item].toString()),
                ],
              ),
              title: Text('Test.....$item' + name[item]),
              subtitle: Text(name[item]),
              trailing: TextButton(
                child: Text('좋아요'),
                onPressed: (){
                  print(name[item]);
                  print(like_cnt);
                  //반드시 state를 재랜더링하기 위해서는 setState()를 수행해야 한다!!!
                  setState(() {
                    like_cnt[item]++;

                  });
                },
              ),
            );
          },

        ),
      ),
    );
  }
}
