import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';
import 'package:igapp/models/notificationmodel.dart';
import 'package:igapp/view_model/ig_view_model.dart';


class IgNotificationScreen extends StatefulWidget {
  const IgNotificationScreen({super.key});

  @override
  State<IgNotificationScreen> createState() => _IgNotificationScreenState();
}

class _IgNotificationScreenState extends State<IgNotificationScreen> {

  IgViewModel igViewModel= IgViewModel();

  Future<void> _refreshData(String data) async {
    // Fetch the updated data from the API
    await igViewModel.fetchIgnotificationApi();
    // Trigger a rebuild with the new data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width*1;
    final height = MediaQuery.sizeOf(context).height*1;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_left, color: Color(0xFFE35B63), size: 60,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 20,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text("अद्वैतम्",style: TextStyle(color: Colors.white,fontSize:height*0.04),),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(top: 30, bottom: 30),
            //   child: Text("Notifications",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontSize: 30,
            //       color: Colors.white,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            SizedBox(
              height: height,
              width: width,
              child: FutureBuilder<notificationmodel>(
                future:igViewModel.fetchIgnotificationApi(),
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
                  else{
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.notifications!.length,
                        itemBuilder: (context,index)
                        {
                       //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                          if(snapshot.data!.notifications[index].data.toString()!="null")
                            {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.bottomCenter,
                                height: height *.2,
                                width: width*.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10),
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
                                                color: Colors.white

                                            ),
                                            child: Center(child: Text(snapshot.data!.notifications![index].data!.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),))),
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
