import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermission() async{
    var status = await Permission.contacts.status;
    if(status.isGranted){
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      //print(contacts[0].familyName);
      var newPerson = Contact();
      newPerson.givenName = 'Miki';
      newPerson.familyName = 'Mouse';
      newPerson.phones = [
        Item(label: 'mobile', value: "123-456-7890"),
        Item(label: 'work', value: '987-654-3210'),
      ];


      ContactsService.addContact(newPerson);
    }else if(status.isDenied){
      print('거절됨');
      Permission.contacts.request(); //허락해 달라고 팝업띄위는 함수
      //openAppSettings();
    }
  }

  @override
  void initState() { // 현 위젯 시작시 실행되는 코드
    // TODO: implement initState
    super.initState();
    //getPermission();
  }
  //State 생성
  var total = 3;
  var cnt = 0;
  var names = ['강백호', '서태웅', '송태섭'];

  addOne(text){
    setState(() {
      total++;
      names.add(text);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('hello'),
        onPressed: (){

          setState(() {
            cnt++;
          });
          showDialog(
              context: context,
              builder: (context){
                return DialogUI(state : cnt.toString(), state2 : names, addOne: addOne);
              }
          );
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [
          IconButton(onPressed: (){
            getPermission();
          }, icon: Icon(Icons.contacts))
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, idx){
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(names[idx] + ' : ' + cnt.toString()),
          );
        }),
    );
  }
}

class DialogUI extends StatelessWidget {

  DialogUI({super.key, this.state, this.state2, this.addOne});

  var state;
  final state2;
  var addOne; //자식 위젯에서 부모 위젯의 데이터를 수정할 때 사용할 함수
  var inputData = TextEditingController();
  //var inputData2;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
              // onChanged: (text){
              //   inputData2 = text;
              //   print(inputData2);
              //   },
            ),
            Text(state[0]),
            TextButton(
                onPressed: (){

                  addOne(inputData.text);
                },
                child: Text('완료')
            ),
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('취소'),
            ),
          ],
        )
      ),
    );
  }
}
