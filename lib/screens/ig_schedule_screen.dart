import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/screens/HomeScreen.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';

import '../models/schedule.dart';

class IgScheduleScreen extends StatefulWidget {
  const IgScheduleScreen({super.key});

  @override
  State<IgScheduleScreen> createState() => _IgScheduleScreenState();
}

enum FilterList {
  zerothday,
  firstday,
}

class _IgScheduleScreenState extends State<IgScheduleScreen> {
  IgViewModel igViewModel = new IgViewModel();
  FilterList? selectedMenu;

  final format = DateFormat('dd/MM/yy');
  String name = "10-02-2023";

  Future<void> _refreshData(String data) async {
    await igViewModel.fetchIgscheduleApi(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    Color myColor = Color(0xff58F3A8);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_left_outlined,
              color: Colors.redAccent,
              size: height * 0.07,
            )),
        backgroundColor: Colors.black,
        titleSpacing: 20,
        title: Center(
          child: Text(
            'अद्वैतम्',
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        actions: [
          PopupMenuButton<FilterList>(
              initialValue: selectedMenu,
              onSelected: (FilterList item) {
                if (FilterList.zerothday.name == item.name) {
                  name = '10-02-2023';
                  _refreshData(name);
                }
                if (FilterList.firstday.name == item.name) {
                  name = '11-02-2023';
                  _refreshData(name);
                }
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<FilterList>>[
                    PopupMenuItem<FilterList>(
                      value: FilterList.zerothday,
                      child: Text('10/02/2023'),
                    ),
                    PopupMenuItem<FilterList>(
                      value: FilterList.firstday,
                      child: Text('11/02/2023'),
                    ),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
              height: height * 0.001,
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        DateFormat.d().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: height * 0.04, color: Colors.redAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.EEEE().format(DateTime.now()),
                            style: TextStyle(
                                fontSize: height * 0.016, color: Colors.white),
                          ),
                          Text(
                            DateFormat('MMMM yyyy').format(DateTime.now()),
                            style: TextStyle(
                                fontSize: height * 0.016, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.35,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.22,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.026, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Day',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height * 0.030),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.02, 0, width * 0.01, 0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: height * 0.035,
                                    color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blueAccent,
              height: height * 0.001,
            ),
            Container(
              color: Colors.black,
              height: height * 0.09,
              child: Expanded(child: ButtonSelection()),
            ),
            Container(
              height: height * 0.034,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(11)),
              child: Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: Center(
                      child: Text(
                        'Time',
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.05),
                      ),
                    ),
                    decoration: BoxDecoration(color: Colors.grey[400]),
                  ),
                  Container(
                    width: width * 0.6,
                    child: Center(
                      child: Text(
                        'Event',
                        style: TextStyle(
                            color: Colors.redAccent, fontSize: width * 0.05),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                    width: width * 0.4,
                    height: height,
                    color: Colors.black,
                    child: SizedBox(
                      height: height,
                      width: width * 0.595,
                      child: FutureBuilder<schedulemodel>(
                        future: igViewModel.fetchIgscheduleApi(name),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SpinKitCircle(
                                size: height * 0.07,
                                color: Colors.blue,
                              ),
                            );
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.schedules!.length,
                                itemBuilder: (context, index) {
                                  //DateTime dateTime = DateTime.parse(snapshot.data!.schedules![index].date.toString());
                                  if (snapshot.data!.schedules![index].time
                                          .toString() !=
                                      "null") {
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.bottomCenter,
                                      height: height * .22,
                                      width: width * .9,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Container(
                                                  width: width * 0.2,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.black),
                                                  child: Center(
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .schedules![index]
                                                          .time
                                                          .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: myColor),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          }
                        },
                      ),
                    )),
                Container(
                  color: Colors.blueAccent,
                  width: height * 0.001,
                ),
                Container(
                  color: Colors.black,
                  child: SizedBox(
                    height: height,
                    width: width * 0.595,
                    child: FutureBuilder<schedulemodel>(
                      future: igViewModel.fetchIgscheduleApi(name),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: SpinKitCircle(
                              size: height * 0.07,
                              color: Colors.blue,
                            ),
                          );
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.schedules!.length,
                              itemBuilder: (context, index) {
                                //DateTime dateTime = DateTime.parse(snapshot.data!.schedules![index].date.toString());
                                if (snapshot.data!.schedules![index].team1
                                        .toString() !=
                                    "null") {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.bottomCenter,
                                    height: height * .22,
                                    width: width * .9,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Container(
                                                width: width * 0.4,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                        child: Text(
                                                      snapshot
                                                          .data!
                                                          .schedules![index]
                                                          .team1
                                                          .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    )),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                            child: Text(
                                                          'VS',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        )),
                                                      ],
                                                    ),
                                                    Center(
                                                        child: Text(
                                                      snapshot
                                                          .data!
                                                          .schedules![index]
                                                          .team2
                                                          .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    )),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const spinkitty = SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);

// class NumberedList extends StatelessWidget {
//   const NumberedList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       scrollDirection: Axis.horizontal,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 1,
//       ),
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {},
//           child: NumberedBox(number: index + 1),
//         );
//       },
//     );
//   }
// }

// class NumberedBox extends StatelessWidget {
//   final int number;

//   const NumberedBox({super.key, required this.number});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width * 1;
//     final height = MediaQuery.sizeOf(context).height * 1;
//     return Padding(
//       padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ButtonStyle(),
//         child: Column(
//           children: [
//             Center(
//               child: Text(
//                 '$number',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: height * 0.030,
//                 ),
//               ),
//             ),
//             Text(
//               getCustomWeekdayName(DateTime.now().number),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// String getCustomWeekdayName(int number) {
//   Map<int, String> customNames = {
//     1: 'Sun',
//     2: 'Mon',
//     3: 'Tue',
//     4: 'Wed',
//     5: 'Thu',
//     6: 'Fri',
//     7: 'Sat',
//   };
//   if (number < 1 || number > 7) {
//     return 'Invalid Weekday';
//   }
//   return customNames[number] ?? 'Unknown';
// }

class ButtonSelection extends StatefulWidget {
  @override
  _ButtonSelectionState createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  String selectedButton = '';

  void selectButton(String buttonId) {
    setState(() {
      selectedButton = buttonId;
    });
  }

  Widget buildButton(String buttonText) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: width * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                selectedButton == buttonText ? Colors.white : Colors.grey[700]),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.003,
            ),
            InkWell(
              onTap: () {
                selectedButton == buttonText ? Colors.white : Colors.grey[700];
              },
              child: Text(
                DateFormat('EEE').format(DateTime.now()),
                style:
                    TextStyle(fontSize: height * 0.02, color: Colors.grey[400]),
              ),
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.black, fontSize: height * 0.029),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.01;
    final double verticalPadding = screenSize.height * 0.02;
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildButton('1'),
          SizedBox(width: horizontalPadding),
          buildButton('2'),
          SizedBox(width: horizontalPadding),
          buildButton('3'),
          SizedBox(width: horizontalPadding),
          buildButton('4'),
          SizedBox(width: horizontalPadding),
          buildButton('5'),
          SizedBox(width: horizontalPadding),
          buildButton('6'),
          SizedBox(width: horizontalPadding),
          buildButton('7'),
          SizedBox(width: horizontalPadding),
          buildButton('8'),
          SizedBox(width: horizontalPadding),
          buildButton('9'),
          SizedBox(width: horizontalPadding),
          buildButton('10'),
        ],
      ),
    );
  }
}
