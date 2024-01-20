import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';
import 'package:igapp/models/notificationmodel.dart';


class IgNotificationScreen extends StatefulWidget {
  const IgNotificationScreen({super.key});

  @override
  State<IgNotificationScreen> createState() => _IgNotificationScreenState();
}

class _IgNotificationScreenState extends State<IgNotificationScreen> {

  IgViewModel igViewModel= new IgViewModel();

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
        titleSpacing: 20,
        title: Text('Notification', style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: FutureBuilder<notificationmodel>(
                future:igViewModel.fetchIgnotificationApi(),
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
                        itemCount: snapshot.data!.notifications!.length,
                        itemBuilder: (context,index)
                        {
                       //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                          if(snapshot.data!.notifications[index].data.toString()!="null")
                            {
                              return Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                height: height *.22,
<<<<<<< HEAD
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
                                            child: Center(child: Text(snapshot.data!.notifications[index].data.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),))),
                                      ),
=======
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                           width:width*0.9,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.blue

                                          ),
                                          child: Center(child: Text(snapshot.data!.notifications[index].data.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),))),
>>>>>>> origin/master

                                    ],
                                  ),
                                ),
                              );
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
