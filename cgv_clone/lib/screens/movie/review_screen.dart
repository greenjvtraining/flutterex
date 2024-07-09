
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/movies.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.item});

  final Movie item;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController reviewIdController = new TextEditingController();
  TextEditingController reviewTextController = new TextEditingController();

  List<String> choices = ["GOOD", "BAD"];
  int choice_index = 0;

  @override
  Widget build(BuildContext context) {

    Movie thisMovie = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "관람평 등록",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.black12,
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "이 영화 어땠나요?",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: List<Widget>.generate(
                    choices.length, (index){
                      return ChoiceChip(
                        padding: EdgeInsets.all(10.0),
                        label: Text(
                          choices[index],
                          style: TextStyle(
                            color: (choice_index == index) ? Colors.white : Colors.black,
                            fontSize: 20
                          ),
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        selected: choice_index == index,
                        onSelected: (value){
                          setState(() {
                            choice_index = index;
                          });
                        },
                        backgroundColor: Colors.white,
                        selectedColor: Colors.red,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
          // 리뷰 작성 영역
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //제목
                Text(
                  "나의 감상평",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: reviewIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '작성자'
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  controller: reviewTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "내용",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: (){
                      //유효값 체크 로직 등을 작성
                      if(reviewIdController.text.isEmpty || reviewTextController.text.isEmpty){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Text('리뷰를 입력하세요.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      '제출',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

