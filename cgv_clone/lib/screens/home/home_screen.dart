import 'package:cgv_clone/widgets/image_slider_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/movie_chart_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> menuItems = [
      "홈",
      "이벤트",
      "무비톡",
      "패스트오더",
      "기프트샵",
      "@CGV",
    ];

    List<String> bannerUrlItems = [
      "assets/images/banner_01.jpg",
      "assets/images/banner_02.jpg",
      "assets/images/banner_03.jpg",
      "assets/images/banner_04.jpg",
    ];
    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "CGV",
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.airplane_ticket_outlined),
              color: Colors.red,
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.movie_outlined),
              color: Colors.red,
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.menu),
              color: Colors.red,
            ),

          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              color: Colors.red,
              child: TabBar(
                tabs: List.generate(
                    menuItems.length,
                        (index) => Tab(
                      text: menuItems[index],
                    ),
                ),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ImageSliderWidget(bannerUrlItems: bannerUrlItems),
                MovieChartWidget(),
                Divider(thickness: 8.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildLableIcon(Icons.phone_android, "MY CGV"),
                      buildLableIcon(Icons.photo, "포토플레이"),
                      buildLableIcon(Icons.account_balance_wallet, "할인정보"),
                      buildLableIcon(Icons.music_note, "CGV 스토어"),
                    ],
                  ),
                ),
              ],

            ),
            // Center(
            //   child: Text("홈 화면입니다."),
            // ),
            Center(
              child: Text("이벤트 화면입니다."),
            ),
            Center(
              child: Text("무비톡 화면입니다."),
            ),
            Center(
              child: Text("패스트오더 화면입니다."),
            ),
            Center(
              child: Text("기프트샵 화면입니다."),
            ),
            Center(
              child: Text("@CGV 화면입니다."),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildLableIcon(IconData icon, String label){
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black12,

          ),
          child: Icon(icon),
        ),
        SizedBox(height: 5.0,),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
