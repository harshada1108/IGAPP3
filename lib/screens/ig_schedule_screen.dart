

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';

import '../models/schedule.dart';



class IgScheduleScreen extends StatefulWidget {
  const IgScheduleScreen({super.key});

  @override
  State<IgScheduleScreen> createState() => _IgScheduleScreenState();
}


enum FilterList{ zerothday, firstday }
class _IgScheduleScreenState extends State<IgScheduleScreen> {
  IgViewModel igViewModel= new IgViewModel();
  FilterList? selectedMenu;

  final format= DateFormat('dd/MM/yy');
  String name='20231120';

  Future<void> _refreshData(String data) async {
    // Fetch the updated data from the API
    await igViewModel.fetchIgscheduleApi(data);
    // Trigger a rebuild with the new data
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;
    return  Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Text('Schedule', style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
        actions: [
          PopupMenuButton<FilterList>(
              initialValue: selectedMenu,
              onSelected: (FilterList item){
                if(FilterList.zerothday.name == item.name)
                {
                  name='20231120';
                  _refreshData(name);
                }
                if(FilterList.firstday.name == item.name)
                {
                  name='20231121';
                  _refreshData(name);
                }



                setState(() {
                  selectedMenu=item;
                });
              },
              itemBuilder: (BuildContext context)=> <PopupMenuEntry<FilterList>>[
                PopupMenuItem<FilterList>(
                  value: FilterList.zerothday,
                  child: Text('20/11/2023'),),
                PopupMenuItem<FilterList>(
                  value: FilterList.firstday,
                  child: Text('21/11/2023'),),
              ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: FutureBuilder<schedulemodel>(
                future:igViewModel.fetchIgscheduleApi(name),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  }
                  else{
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.schedules!.length,
                        itemBuilder: (context,index)
                        {
                          DateTime dateTime = DateTime.parse(snapshot.data!.schedules![index].date.toString());
                          return Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.bottomCenter,
                            height: height *.22,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                  color: Colors.blueAccent,
                                ),
                              
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     Container(
                                       width:width*0.3,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         color: Colors.white60
                                       ),
                                         child: Center(child: Text(snapshot.data!.schedules![index].team1.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),))),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'VS',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black87),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          width:width*0.3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white60
                                          ),
                                          child: Center(child: Text(snapshot.data!.schedules![index].team2.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),))),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  }
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
const spinkitty=SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);