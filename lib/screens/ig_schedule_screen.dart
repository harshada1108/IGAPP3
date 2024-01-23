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
  String name="10-02-2023";

  Future<void> _refreshData(String data) async {
    await igViewModel.fetchIgscheduleApi(data);
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
                  name='10-02-2023';
                  _refreshData(name);
                }
                if(FilterList.firstday.name == item.name)
                {
                  name='11-02-2023';
                  _refreshData(name);
                }
                setState(() {
                  selectedMenu=item;
                });
              },
              itemBuilder: (BuildContext context)=> <PopupMenuEntry<FilterList>>[
                PopupMenuItem<FilterList>(
                  value: FilterList.zerothday,
                  child: Text('10/02/2023'),),
                PopupMenuItem<FilterList>(
                  value: FilterList.firstday,
                  child: Text('11/02/2023'),),
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
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  }
                  else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.schedules!.length,
                        itemBuilder: (context,index)
                        {
                          //DateTime dateTime = DateTime.parse(snapshot.data!.schedules![index].date.toString());
                          if(snapshot.data!.schedules![index].team1.toString()!="null")
                          {
                            return Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomCenter,
                              height: height *.22,
                              width: width*.9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Container(
                                          width:width*0.8,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.blue

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Center(child: Text(snapshot.data!.schedules![index].team1.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),)),
                                              Column(
                                                children: [

                                                  Center(child: Text('VS',maxLines:1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),)),
                                                  Center(child: Text(snapshot.data!.schedules![index].venue.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),)),

                                                ],
                                              ),

                                              Center(child: Text(snapshot.data!.schedules![index].team2.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),)),

                                            ],
                                          )),
                                    ),
                                  ],
                                ),),);
                          }
                          else{
                            return Container();
                          }
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