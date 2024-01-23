import 'package:flutter/material.dart';
import 'package:igapp/screens/ig_schedule_screen.dart';
import 'package:igapp/screens/igenthu.dart';
import 'package:igapp/screens/igleader2.dart';
import 'package:igapp/screens/notification_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> assetImages = [
      'deptlogos/ids333-removebg-preview.png',
      'deptlogos/ARC.png',
      'deptlogos/CIV.png',
      'deptlogos/CME.png',
      'deptlogos/CSE.png',
      'deptlogos/ECE.png',
      'deptlogos/EE.png',
      'deptlogos/MECH.png',
      'deptlogos/MIN.png',
      'deptlogos/MME.png',
      // Add more asset image paths as needed
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        width: width*0.7,
      ),

      appBar: AppBar(

          title: Text("अद्वैतम्",style: TextStyle(color: Colors.white,fontSize:height*0.05),),

          leading: IconButton(icon: Icon(Icons.menu,size: height*0.05,color: Colors.white,), onPressed: () {  },),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.notification_add_outlined,size:  height*0.05,color: Colors.white,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IgNotificationScreen()));


                },
              ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: height*0.1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
              itemCount: assetImages.length, // Number of stories
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(assetImages[index]),

                    radius: height*0.04,
                  ),
                );



                }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IgScheduleScreen()));
                },
                child: Container(
                  height: height*0.2,
                  width: width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height*0.02),
                   color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade700.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image:DecorationImage(image: AssetImage("deptlogos/SCHEDULE.jpg"),
                    fit: BoxFit.cover) ,

                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IgEnthuScreen()));
                      },
                      child: Container(
                        height: height*0.2,
                      width: width*0.4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade700.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(height*0.05),topRight: Radius.circular(height*0.01),
                            bottomRight: Radius.circular(height*0.01),bottomLeft: Radius.circular(height*0.01)),
                            color: Colors.white
                          // image:DecorationImage(image: AssetImage()) ,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Enthu",style: TextStyle(fontSize: height*0.03,fontWeight: FontWeight.w500,),),
                              Text("Points",style: TextStyle(fontSize: height*0.03,fontWeight: FontWeight.w500)),
                            ],

                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IgLeaderScreen()));

                    },
                    child: Container(
                      height: height*0.2,
                      width: width*0.4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            spreadRadius: 5,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(height*0.01),topRight: Radius.circular(height*0.05),
                              bottomRight: Radius.circular(height*0.01),bottomLeft: Radius.circular(height*0.01)),
                          color: Color(0xFFF76858),
                        // image:DecorationImage(image: AssetImage()) ,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Leader",style: TextStyle(fontSize: height*0.03,fontWeight: FontWeight.w500,),),
                            Text("Points",style: TextStyle(fontSize: height*0.03,fontWeight: FontWeight.w500,),),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Container(

              height: height*0.2,
              width: width*0.9,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700.withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(height*0.02),
                  color: Colors.white,
                 image:DecorationImage(image: AssetImage("deptlogos/PIC.jpg"),fit: BoxFit.cover) ,

              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: height*0.2,
                      width: width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(height*0.02),
                              bottomRight: Radius.circular(height*0.02),bottomLeft: Radius.circular(height*0.02)),
                          color: Colors.white
                        // image:DecorationImage(image: AssetImage()) ,
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.2,
                    width: width*0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(height*0.02),
                            bottomRight: Radius.circular(height*0.02),bottomLeft: Radius.circular(height*0.02)),
                        color: Color(0xFF9B51FF),
                      // image:DecorationImage(image: AssetImage()) ,
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: height*0.2,
                      width: width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(height*0.02),topLeft:Radius.circular(height*0.02) ,
                              bottomRight: Radius.circular(height*0.02)),
                          color: Colors.blue
                        // image:DecorationImage(image: AssetImage()) ,
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.2,
                    width: width*0.4,
                    decoration: BoxDecoration(

                       image: DecorationImage(
                         image: AssetImage( 'deptlogos/ids333-removebg-preview.png'),
                         fit: BoxFit.cover,
                       ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(height*0.02),topRight:  Radius.circular(height*0.02)
                            ,bottomLeft: Radius.circular(height*0.02)),
                        color: Colors.grey
                      // image:DecorationImage(image: AssetImage()) ,
                    ),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
