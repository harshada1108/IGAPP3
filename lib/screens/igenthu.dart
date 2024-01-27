
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:igapp/models/ig_leader_model.dart';
//import 'package:provider/provider.dart';
import '../SharedPreferences/SpFunctionsForEnthuBoard.dart';
import '../SharedPreferences/SpFunctionsForLeaderB.dart';
import '../models/ig_enthu_model.dart';
import '../view_model/ig_view_model.dart';
//import 'package:igapp/Theme/ThemeModal.dart';
import '';

class IgEnthuScreen extends StatefulWidget {
  const IgEnthuScreen({super.key});

  @override
  State<IgEnthuScreen> createState() => _IgEnthuScreenState();
}

class _IgEnthuScreenState extends State<IgEnthuScreen> {
  late Future<igmodel> leaderModelFuture;
  bool isDataFetched = false;
  late int csep;
  late var cseval1;
  late AsyncSnapshot<int> cseval = AsyncSnapshot<int>.nothing();
  late int mechp;
  late var mechval1;
  late AsyncSnapshot<int> mechval = AsyncSnapshot<int>.nothing();
  late int civp;
  late var civval1;
  late AsyncSnapshot<int> civval = AsyncSnapshot<int>.nothing();
  late int metap;
  late var metaval1;
  late AsyncSnapshot<int> metaval = AsyncSnapshot<int>.nothing();
  late int chemminp;
  late var chemminval1;
  late AsyncSnapshot<int> chemminval = AsyncSnapshot<int>.nothing();
  late int archip;
  late var archival1;
  late AsyncSnapshot<int> archival = AsyncSnapshot<int>.nothing();
  late int ecep;
  late var eceval1;
  late AsyncSnapshot<int> eceval = AsyncSnapshot<int>.nothing();
  late int eeep;
  late var eeeval1;
  late AsyncSnapshot<int> eeeval = AsyncSnapshot<int>.nothing();


  IgViewModel igViewModel = IgViewModel();
  Future<void> _refreshdaTa() async {
    await igViewModel.fetchIgApi();

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leaderModelFuture = igViewModel.fetchIgApi() ;
    EgetCseFromSharedPreferences().then((value) {
      setState(() {
        cseval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? csep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetMechFromSharedPreferences().then((value) {
      setState(() {
        mechval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? mechp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetMetaFromSharedPreferences().then((value) {
      setState(() {
        metaval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? metap, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetChemminFromSharedPreferences().then((value) {
      setState(() {
        chemminval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? chemminp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetCivFromSharedPreferences().then((value) {
      setState(() {
        civval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? civp, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetArchiFromSharedPreferences().then((value) {
      setState(() {
        archival = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? archip, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetEceFromSharedPreferences().then((value) {
      setState(() {
        eceval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? ecep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });

    EgetEeeFromSharedPreferences().then((value) {
      setState(() {
        eeeval = AsyncSnapshot<int>.withData(
          ConnectionState.done,
          value ?? eeep, // Provide a default value if null
        );
        isDataFetched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

      final width = MediaQuery
          .of(context)
          .size
          .width * 1;
      final height = MediaQuery
          .of(context)
          .size
          .height * 1;

      return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.black87,
          leading: IconButton(
            icon: const Icon(Icons.arrow_left, color : Color(0xFFE35B63), size: 60,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top :20),
            child: Text("अद्वैतम्",style: TextStyle(color: Colors.white,fontSize:height*0.04),),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<igmodel>(
                future: leaderModelFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.cyanAccent,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    cseval1 = cseval;
                    mechval1 = mechval;
                    eceval1 = eceval;
                    civval1 = civval;
                    chemminval1 = chemminval;
                    eeeval1 = eeeval;
                    metaval1 = metaval;
                    archival1 = archival;
                  } else
                  if (snapshot.data == null || snapshot.data.points == null) {
                    return Center(
                      child: Text(
                        'No Data Available :-( Try after 24 Hours',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  } else {
                    csep = snapshot.data.points.cSE ?? csep;
                    mechp = snapshot.data.points.mECH ?? mechp;
                    chemminp = snapshot.data.points.cHEMMIN ?? chemminp;
                    archip = snapshot.data.points.aRCHI ?? archip;
                    metap = snapshot.data.points.mETA ?? metap;
                    ecep = snapshot.data.points.eCE ?? ecep;
                    eeep = snapshot.data.points.eEE ?? eeep;
                    civp = snapshot.data.points.cIVIL ?? civp;


                    EsaveCseToSharedPreferences(csep);
                    EsaveArchiToSharedPreferences(archip);
                    EsaveChemminToSharedPreferences(chemminp);
                    EsaveCivToSharedPreferences(civp);
                    EsaveEceToSharedPreferences(ecep);
                    EsaveEeeToSharedPreferences(eeep);
                    EsaveMechToSharedPreferences(mechp);
                    EsaveMetaToSharedPreferences(metap);

                    if (!isDataFetched &&
                        (cseval.connectionState == ConnectionState.none ||
                            cseval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetCseFromSharedPreferences().then((value) {
                        setState(() {
                          cseval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? csep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (mechval.connectionState == ConnectionState.none ||
                            mechval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetMechFromSharedPreferences().then((value) {
                        setState(() {
                          mechval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? mechp, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }

                    if (!isDataFetched &&
                        (civval.connectionState == ConnectionState.none ||
                            civval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      getCivFromSharedPreferences().then((value) {
                        setState(() {
                          civval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? civp, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (chemminval.connectionState == ConnectionState.none ||
                            chemminval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetChemminFromSharedPreferences().then((value) {
                        setState(() {
                          chemminval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ??
                                chemminp, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (eceval.connectionState == ConnectionState.none ||
                            eceval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetEceFromSharedPreferences().then((value) {
                        setState(() {
                          eceval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? ecep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (eeeval.connectionState == ConnectionState.none ||
                            eeeval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetEeeFromSharedPreferences().then((value) {
                        setState(() {
                          eeeval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? eeep, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (archival.connectionState == ConnectionState.none ||
                            archival.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetArchiFromSharedPreferences().then((value) {
                        setState(() {
                          archival = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? archip, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                    if (!isDataFetched &&
                        (metaval.connectionState == ConnectionState.none ||
                            metaval.connectionState ==
                                ConnectionState.waiting)) {
                      // Fetch the CSE value only once when the AsyncSnapshot is not done yet
                      EgetMetaFromSharedPreferences().then((value) {
                        setState(() {
                          metaval = AsyncSnapshot<int>.withData(
                            ConnectionState.done,
                            value ?? metap, // Provide a default value if null
                          );
                          isDataFetched = true;
                        });
                      });
                    }
                  }
                  List<String> departmentNames = [
                    'CSE',
                    'MECH',
                    'CIVIL',
                    'META',
                    'CHEMMIN',
                    'ARCHI',
                    'ECE',
                    'EEE',
                  ];
                  List<String> points = [
                    cseval.data.toString() ?? cseval1.data.toString(),
                    mechval.data.toString() ?? mechval1.data.toString(),
                    civval.data.toString() ?? civval1.data.toString(),
                    metaval.data.toString() ?? metaval1.data.toString(),
                    chemminval.data.toString() ?? chemminval1.data.toString(),
                    archival.data.toString() ?? archival1.data.toString(),
                    eceval.data.toString() ?? eceval1.data.toString(),
                    eeeval.data.toString() ?? eeeval1.data.toString(),
                  ];

                  return Container(
                    width: width,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: height*0.1),
                        child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.cyanAccent),
                            columns: [
                              DataColumn(
                                label: Text(
                                  'RANK',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'ENTHUBOARD',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'POINTS',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(departmentNames.length, (index) {
                              String departmentName = departmentNames[index];
                              String Points = points[index];

                              return DataRow(cells: [
                                DataCell(
                                  Text(
                                    (index + 1).toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    departmentName,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    Points,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                              ]);
                            })


                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  }
}
