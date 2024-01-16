import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/article_model.dart';
import 'package:igapp/view_model/ig_view_model.dart';
import 'package:intl/intl.dart';


class IgArticleScreen extends StatefulWidget {
  const IgArticleScreen({super.key});

  @override
  State<IgArticleScreen> createState() => _IgArticleScreenState();
}

class _IgArticleScreenState extends State<IgArticleScreen> {

  IgViewModel igViewModel= new IgViewModel();

  Future<void> _refreshData(String data) async {
    // Fetch the updated data from the API
    await igViewModel.fetchIgarticleApi();
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
        title: Text('Article', style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: FutureBuilder<articlemodel>(
                future:igViewModel.fetchIgarticleApi(),
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
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context,index)
                        {
                          //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                          if(snapshot.data!.articles[index].data.toString()!="null")
                          {
                            return Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomCenter,
                              height: height *.32,
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
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Center(child: Text(snapshot.data!.articles[index].data.toString(),maxLines:3,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700),)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Center(child: Text(snapshot.data!.articles[index].department.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w400),)),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),



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
