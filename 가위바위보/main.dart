import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/userData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int total = 0;
  int winCnt = 0;
  int loseCnt = 0;
  int drawCnt = 0;
  String result = "";
  String imgPath_com = "assets/images/com.png";
  String imgPath_user = "assets/images/user.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('가위-바위-보'),
              ),
              body: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(imgPath_user, width: 100, height: 100, errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error);
                        }),
                        SizedBox(width: 10),
                        Text('VS', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Image.asset(imgPath_com, width: 100, height: 100, errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error);
                        }),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 400,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        '$total전 $winCnt승 $drawCnt무 $loseCnt패',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 48),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //컴이 낸다.
                            int com = Random().nextInt(3) + 1;
                            print(com);
                            String img = "";
                            if(com == 1) img = "scissors";
                            else if(com == 2) img = "rock";
                            else img = "paper";
                            //내가 낸다.
                            int user = 1;
                            //판정 한다.

                            setState(() {
                              imgPath_com = "assets/images/${img}.png";
                              imgPath_user = "assets/images/scissors.png";
                              result = _decision(com, user);
                              total++;
                            });
                            _showAlertDialog(context, result);

                            _sendData();
                          },
                          child: Text('가위'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //컴이 낸다.
                            int com = Random().nextInt(3) + 1;
                            print(com);
                            String img = "";
                            if(com == 1) img = "scissors";
                            else if(com == 2) img = "rock";
                            else img = "paper";
                            //내가 낸다.
                            int user = 2;
                            //판정 한다.

                            setState(() {
                              imgPath_com = "assets/images/${img}.png";
                              imgPath_user = "assets/images/rock.png";
                              result = _decision(com, user);
                              total++;
                            });
                            _showAlertDialog(context, result);
                            _sendData();
                          },
                          child: Text('바위'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //컴이 낸다.
                            int com = Random().nextInt(3) + 1;
                            print(com);
                            String img = "";
                            if(com == 1) img = "scissors";
                            else if(com == 2) img = "rock";
                            else img = "paper";
                            //내가 낸다.
                            int user = 3;

                            //판정 한다.
                            setState(() {
                              imgPath_com = "assets/images/${img}.png";
                              imgPath_user = "assets/images/paper.png";
                              result = _decision(com, user);
                              total++;
                            });
                            _showAlertDialog(context, result);
                            _sendData();
                          },
                          child: Text('보'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          );
        }
      ),
    );
  }

  String _decision(int com, int user){
    int result = user - com;
    String decision = "";
    if(result == 1 || result == -2){
      decision = "Win";
      winCnt++;
    }else if(result == 0){
      decision = "Draw";
      drawCnt++;
    }else{
      decision = "Lose";
      loseCnt++;
    }
    return decision;
  }

  void _showAlertDialog(BuildContext context, String result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('승부는?'),
            content: Text('This is an alert dialog: $result'),
            actions: [
              TextButton(
                onPressed: () {

                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        }
    );
  }

  Future<void> _sendData() async{

    //서버 주소
    String url = 'http://172.30.1.78:9099/api/post';
    //전송할 데이터
    final data = {
      'total': total,
      'win': winCnt,
      'draw': drawCnt,
      'lose': loseCnt
    };
    //POST 요청 보내기
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    //응답 처리
    if(response.statusCode == 200){
      print('OK...good' + response.body);
    }else{
      print('데이터 전송 실패 : ${response.statusCode}');
    }

  }
}
