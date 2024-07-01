import 'package:flutter/material.dart';
import 'package:t0701/services/fetchCultural.dart';

import 'models/cultural.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test....',
      home: _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen({super.key});

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  late Future<List<Cultural>> cultural;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cultural = fetchCultural();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.menu),
        title: Text('함해보자...',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD750),
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Icon(Icons.camera),
              SizedBox(width: 20,),
              Icon(Icons.contacts),
              SizedBox(width: 20,),
            ],
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Cultural>>(
          future: cultural,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return

                  //Text(snapshot.data?.length != 0 ? snapshot.data![1].MYONGCHING : "없음"),
                  //Text(snapshot.data?.length != 0 ? snapshot.data![1].CONTENT : "없음"),
                  ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index){
                      if (snapshot.data == null || index >= snapshot.data!.length) {
                        return CircularProgressIndicator(); // 데이터가 로딩 중일 때 로딩 스피너 표시
                      }
                      var myongching = snapshot.data![index].MYONGCHING ?? 'No data'; // MYONGCHING이 null일 경우 기본값 설정

                      return Container(
                        width: double.infinity, // 부모의 너비를 채우도록 설정
                        padding: EdgeInsets.all(8.0), // 패딩 추가
                        child: ListTile(
                          title: Text(myongching),
                        ),
                      );
                    }
                  );

            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),

    );
  }
}

