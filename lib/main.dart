import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/datas/datas.dart';
import 'dart:io';
import 'package:flutter_news/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex =0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();

  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context,index){
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length -1 ? Container(
        height: Platform.isAndroid ? 50 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            GestureDetector(
              onTap: (){
                pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
                child: Text("SKIP")),
            Row(
              children: <Widget>[
        for(int i = 0; i < slides.length; i++) currentIndex == i ? pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
                onTap: (){
                  pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text("NEXT")),
          ],
        ),
      ) : Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isAndroid ? 70 : 60,
        color: Colors.pink,
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Text("Get Started Now",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
        ),
      ),
    );
  }
}


class SliderTile extends StatelessWidget {
  String imageAssetPath,title,desc;
  SliderTile({this.imageAssetPath,this.title,this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(height: 28,),
          Text(title,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 12,),
          Text(desc,textAlign: TextAlign.center,style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16
          ),),
        ],
      ),
    );
  }
}

