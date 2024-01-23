// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:igapp/models/ig_leader_model.dart';
//
// import '../view_model/ig_view_model.dart';
//
// class IgleaderScreen extends StatefulWidget {
//   const IgleaderScreen({Key? key}) : super(key: key);
//
//   @override
//   State<IgleaderScreen> createState() => _IgleaderScreenState();
// }
//
// class _IgleaderScreenState extends State<IgleaderScreen> {
//   // Create an instance of your view model
//   IgViewModel igViewModel = IgViewModel();
//
//   // Method to refresh data when the user pulls down
//   Future<void> _refreshData() async {
//     // Fetch the updated data from the API
//     await igViewModel.fetchIgleaderApi();
//     // Trigger a rebuild with the new data
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height
//     final width = MediaQuery.sizeOf(context).width * 1;
//     final height = MediaQuery.sizeOf(context).height * 1;
//
//     // Scaffold is the main container for your screen
//     return Scaffold(
//       // AppBar is the top bar with the title
//       appBar: AppBar(
//         title: Text(
//           'Ig LeaderBoard',
//           style: GoogleFonts.poppins(
//             fontSize: 25,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: _refreshData, icon: Icon(Icons.refresh),),
//         ],
//       ),
//       // Padding adds some space around the body
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: RefreshIndicator(
//           // onRefresh is called when the user pulls down to refresh
//           onRefresh: _refreshData,
//           // Column is a vertical layout container
//           child: Column(
//             children: [
//               // Expanded widget takes all available vertical space
//               Expanded(
//                 child: FutureBuilder<igleadermodel>(
//                   future: igViewModel.fetchIgleaderApi(),
//                   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: SpinKitCircle(
//                           size: 50,
//                           color: Colors.blue,
//                         ),
//                       );
//                     }
//                     // Check if there's an error
//                     else if (snapshot.hasError) {
//                       return Center(
//                         child: Text(
//                           'Turn On Your Mobile Data',
//                           style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w700),
//                         ),
//                       );
//                     }
//                     // Check if there's no data or points
//                     else if (snapshot.data == null || snapshot.data.points == null) {
//                       return Center(
//                         child: Text(
//                           'Turn On Your Mobile Data',
//                           overflow: TextOverflow.ellipsis,
//                           style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w700),
//                         ),
//                       );
//                     }
//                     // If all checks pass, display the data
//                     else {
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Container for CSE data
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('CSE', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.cSE.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('ECE', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.eCE.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('EEE', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.eEE.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('MECH', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.mECH.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('CIVIL', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.cIVIL.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('CHEMMIN', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.cHEMMIN.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('META', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.mETA.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.teal),
//                             height: height * 0.10,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('ARCHI', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                   Text(snapshot.data.points.aRCHI.toString(), style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Add similar code for other containers
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
