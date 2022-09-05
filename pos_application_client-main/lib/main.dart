import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/nav/listtwo.dart';
import 'package:pos_application/providers/beverages_provider.dart';
import 'package:pos_application/providers/dessert_provider.dart';
import 'package:pos_application/providers/index_provider.dart';
import 'package:pos_application/providers/item_provider.dart';
import 'package:pos_application/providers/main_course_provider.dart';
import 'package:pos_application/providers/start_provider.dart';
import 'package:pos_application/splash_screen.dart';
import 'api/startap.dart';
import 'homepage.dart';
import 'nav/list.dart';
import 'nav/home.dart';
import 'nav/settings.dart';
import 'package:provider/provider.dart';
void main() {
  StartApi().getData();


  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context)=>itemProvider()),
          ChangeNotifierProvider(
              create: (context)=>StartProvider()),
          ChangeNotifierProvider(
              create: (context)=>MainCourseProvider()),
          ChangeNotifierProvider(
              create: (context)=>BeveragesProvider()),
          ChangeNotifierProvider(
              create: (context)=>DessertProvider()),
          ChangeNotifierProvider(
              create: (context)=>IndexProvider()),

        ],

        child: const MyApp(),
      )

  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplastScreen(),
    );
  }
}


