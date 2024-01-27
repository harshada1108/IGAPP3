import 'dart:math';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AboutIgApp extends StatefulWidget {
  const AboutIgApp({Key? key}) : super(key: key);

  @override
  _AboutIgAppState createState() => _AboutIgAppState();
}

class _AboutIgAppState extends State<AboutIgApp> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("DEVELOPERS CORNER",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.black,),
      body: Column(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage("deptlogos/ids333-removebg-preview.png",),
          backgroundColor: Colors.black,
          radius: height*0.1,),

          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
                itemCount: dataList.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index);
                }),
          )
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0.0;
          if (_pageController.position.haveDimensions) {


          }
          return Transform.rotate(
            angle: pi * value,
            child: carouselCard(dataList[index]),
          );
        },
    );
  }

  Widget carouselCard(DeveloperModel data) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: height*0.8,
              width: width*0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(height*0.05),
                  image: DecorationImage(
                      image: AssetImage(
                        data.image,
                      ),
                      fit: BoxFit.fill),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ]),
            ),
          ),
        ),
        Text(
          data.name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Contribution in IGAPP:",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(
          data.role,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
         buildInstagramLink(data.profile),
         buildLinkedIn(data.profile),



      ],
    );
  }
}
class DeveloperModel {
  final String image;
  final String name;
  final String role;
  final String profile;
  final String LinkedInLink;


  DeveloperModel(
      this.image,
      this.name,
      this.role,
      this.profile,
      this.LinkedInLink
      );
}

List<DeveloperModel> dataList = [
  DeveloperModel("developersPhoto/bhushan.jpg","Bhushan Bahale","Backend Developer" ,"",""),
  DeveloperModel("developersPhoto/btiwari.jpg","Bhupendra Tiwari","fetching api from nodejs,App Ui","https://www.instagram.com/bhupendratiwarionline/",""),
  DeveloperModel("developersPhoto/harshada1.jpg","Harshada Polshetty","Shared Preferences,App Ui","https://www.instagram.com/harsha_polshetty/",""),
  DeveloperModel("developersPhoto/DhairyaSuryawanshi_App2ndyr.jpg","Dhairya Suryawanshi","App Ui","",""),
  DeveloperModel("developersPhoto/vaidehi.jpg","Vaidehi Kharde","App Ui","",""),

];
void launchInstagramProfile(String profile) async {
  // Replace with your code to open the Instagram profile link
  // You can use packages like url_launcher or others for this purpose
  // Example using url_launcher:
  await launch("$profile");
}

Widget buildInstagramLink(String profile) {
  return InkWell(
    onTap: () {
      launchInstagramProfile(profile);
    },
    child: Text(
      "Instagram link",
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}

Widget buildLinkedIn(String profile) {
  return InkWell(
    onTap: () {
      launchInstagramProfile(profile);
    },
    child: Text(
      "LinkedIn link",
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}