import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/api/startap.dart';
import 'package:pos_application/providers/start_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'nav/home.dart';
import 'nav/list.dart';
import 'nav/listtwo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Widget container =  Home();
  Color? color1 =  Color(0xff7ed7f5);
  Color? color2 = Colors.white;
  Color? color3 = Colors.white;


  String title = '';

  late TabController _tabController;

  @override
  void initState() {



    super.initState();

    _tabController = TabController(initialIndex: 0, vsync: this, length: 3);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          {
            setState(() {
              title = "Profile";
            });
            break;
          }
        case 1:
          {
            setState(() {
              title = "Done";
            });
            break;
          }
        case 2:
          {
            setState(() {
              title = "DashBoard";
            });
            break;
          }

        case 3:
          {
            setState(() {
              title = "DashBoard";
            });
            break;
          }
      }
    });
  }

  Widget getItem(text) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text)
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [

                Color(0xff2b5876 ),
                Color(0xff4e4376),

              ],
            ),
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              flexibleSpace: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                  color: Colors.purple.shade700,
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                child: TabBar(



                  indicatorColor: Color(0xff7ed7f5),
                  indicatorWeight: 1,
                  labelColor: Colors.blueAccent,
                  labelStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                  ),

                  unselectedLabelColor: Colors.white,


                  indicatorPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  tabs: [

                    Tab(
                      icon: Icon(Icons.home_outlined,

                        size: 25,
                      ),


                      // text: 'Start'

                    ),

                    Tab(
                      icon:  Icon(Icons.list_alt_outlined,

                        size: 25,
                      ),
                      // text: 'Main Course',


                    ),

                    Tab(
                        icon:Icon(Icons.settings_outlined,

                          size: 25,
                        )

                      // text: 'Beverages',
                    ),



                  ],
                ),
              ),
            ),
            body:
            TabBarView(children: [Home(),
              // List(),
              ListTwo(),
              // settings(),
              Lists(),
            ],

            ),
          ),
        ),
      ),
    );
  }
}