import 'package:flutter/material.dart';

class StudentCouncilinfo extends StatelessWidget {

  final List<String> image = [
    'images/StudentCouncilImages/HRUSHIKESH JADHAV.jpg',
    'images/StudentCouncilImages/MT22STR010_VINAYAK.jpg',
    'images/StudentCouncilImages/Minza Shahid.jpg',
    'images/StudentCouncilImages/BT20MEC002_ADITYA.jpeg',
    'images/StudentCouncilImages/Dhanesh Choudhary.jpg',
    'images/StudentCouncilImages/BT20EEE019_Nikhil_Bhisle.jpg',
    'images/StudentCouncilImages/Satyan Patil.jpg',
    'images/StudentCouncilImages/Samruddhi Wagh.jpg',
    'images/StudentCouncilImages/GANJI NAYAN.jpg',
    'images/StudentCouncilImages/lr1.jpg',
    'images/StudentCouncilImages/Ayush Chavan.JPG',
    'images/StudentCouncilImages/Alisha Hatalkar.jpg',
    'images/StudentCouncilImages/Yashasvi Therkar.jpg',
    'images/StudentCouncilImages/BT20MEC018 BRAHMANAND Khandale.jpg',
    'images/StudentCouncilImages/Gaurav Mishra.jpg'
  ];
  final List<String> councilposts = [
    'GENERAL SECRETARY',
    'P.G ACADEMIC AFFAIRS SECRETARY',
    'UG ACADEMIC AFFAIRS SECRETARY',
    'MAGAZINE AND LITERARY SECRETARY',
    'TRAINING AND PLACEMENT SECRETARY',
    'TECHNICAL AFFAIRS SECRETARY',
    'SPORTS SCERETARY',
    'CULTURAL SECRETARY',
    'PG SPORTS SEC. & CULTURAL AFFAIRS',
    'LADIES REPRESENTATIVE',
    'HOSTEL AFFAIRS SECRETARY (BOYS)',
    'HOSTEL AFFAIRS SECRETARY (GIRLS)',
    'SOCIAL AFFAIRS SECRETARY',
    'ALUMNI SECRETARY',
    'ACADEMIC AFFAIRS SECRETARY',
  ];
  final List<String> councilnames = [
    'HRUSHIKESH BHAGWAN JADHAV',
    'VINAYAK',
    'MINZA SHAHID',
    'ADITYA MISHRA',
    'DHANESH CHAUDHARY',
    'BHISLE NIKHIL GANGARAM',
    'PATIL SATYAN SHARAD',
    'SAMRUDDHI ATUL WAGH',
    'GANJI NAYAN CHANDRAKANT',
    'SONAWANE MRUNAL KISHOR',
    'CHAVAN AYUSH BHAURAO',
    'HATALKAR ALISHA AMIT',
    'YASHASVI THERKAR',
    'BRAHMANAND C. KHANDALE',
    'GAURAV KUMAR MISHRA',
  ];

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("STUDENT COUNCIL 2024",style: TextStyle(color: Colors.white,fontSize: height*0.03),),centerTitle: true,backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: height*0.02,
          mainAxisSpacing: width*0.02,
        ),
        itemCount: councilnames.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CouncilContainer(
                name: councilnames[index],
                post: councilposts[index],
                imageUrl: image[index], // Replace with your image URL
              ),
            ),
          );
        },
      ),
    );
  }
}

class CouncilContainer extends StatelessWidget {

  final String name;
  final String post;
  final String imageUrl;

  CouncilContainer({required this.imageUrl,required this.name ,required this.post});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CircleAvatar(backgroundImage:AssetImage(imageUrl) ,
        // radius: height*0.3,)
        Container(
          height: height*0.16,
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.fitHeight,
            )
          ),
        ),

        // SizedBox(height: 8.0),
         Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: height*0.015,color: Colors.white),
         ),
        Text(post,style: TextStyle(fontWeight: FontWeight.bold,fontSize: height*0.015,color: Colors.white),),
      ],
    );
  }
}
