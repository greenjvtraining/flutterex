import 'package:cgv_clone/screens/movie/review_screen.dart';
import 'package:flutter/material.dart';
import '../../models/movies.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.thisMovie});

  final Movie thisMovie;

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          thisMovie.title,
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                thisMovie.imageUrl,
                width: appSize.width,
                height: 300,
                fit: BoxFit.cover,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.4),
                      Colors.black,
                    ],
                  ),
                ),
              ),
              //영화포스터, 영화 제목 및 내용
              Positioned(
                left: 10.0,
                bottom: 14.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      thisMovie.imageUrl,
                      width: appSize.width * 0.25,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //영화제목
                          Text(
                            thisMovie.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //영화 부제목
                          Text(
                            thisMovie.subTitle,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          //영화 상영시간
                          Text(
                            thisMovie.runTime,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: OutlinedButton(
              child: Text(
                "실관람평 등록하기",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewScreen(item: thisMovie)),
                );
              },
            ),
          ),
          //데이터베이스 조회 데이터를 작성할 예정
        ],
      ),
    );
  }
}
