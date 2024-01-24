import 'package:flutter/material.dart';
import 'dart:async';

import 'package:igapp/Screens/HomeScreen.dart';
class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {


  late Widget displayedWidget;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    displayedWidget = Container();
    // Initial empty container
    // After 2 seconds, change the displayed widget
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        displayedWidget = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("INSTITUTE",style: TextStyle(fontSize: 24,color: Colors.white)),
            ),
            Text("GATHERING 24'",style: TextStyle(fontSize: 24,color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>HomeScreen(),
                  ),
                );
              },
                child: Text("Get Started",style: TextStyle(color: Colors.black,fontSize: 25),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Set the background color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Set the border radius
                  ),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Developed by",style: TextStyle(fontSize: 12,color: Colors.amberAccent),),
                CircleAvatar(
                  backgroundImage: AssetImage('deptlogos/ids333-removebg-preview.png'),
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.height*0.03,
                )
              ],
            )




          ],

        );
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        children: [
          Container(height: height*0.3,),
          Center(
            child: Text("अद्वैतम्",style: TextStyle(fontSize: height*0.1,color: Colors.white),),
          ),
          displayedWidget,
        ],
      )
    );
  }
}
