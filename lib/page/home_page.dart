
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/page/first_page.dart';
import 'package:flutter_practice_demo/page/second_page.dart';
import 'package:flutter_practice_demo/page/third_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  void selectTab(int index){
    if (currentIndex == index){
      return;
    }
    currentIndex = index;
    pageController.animateToPage(index, duration: kThemeAnimationDuration, curve: Curves.easeInOut);
    setState(() {});
  }

  @override
  void initState(){
    pageController.addListener(() {
      var currentPage = pageController.page?.round();
      if (currentPage != null && currentIndex != currentPage) {
        currentIndex = currentPage;
        setState(() {
        });
      }
    });
    super.initState();
  }

  Widget header() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 30),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlutterLogo(
            size: 50,
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Common Header',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
              Text('1.0.0')
            ],
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(child: PageView(
              controller: pageController,
              children: [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: selectTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "我的"),
        ],

      ),
    );
  }

}
