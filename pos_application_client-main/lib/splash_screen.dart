import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/homepage.dart';
import 'package:pos_application/providers/start_provider.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'api/startap.dart';

class SplastScreen extends StatefulWidget {


  @override
  _SplastScreenState createState() => _SplastScreenState();
}

class _SplastScreenState extends State<SplastScreen> {

  @override
 void initState() {
    // TODO: implement initState
    super.initState ();
    StartApi().getData();
    Provider.of<StartProvider>(context,listen:false).categoryItem();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ Color(0xff2b5876 ),Color(0xff4e4376),],
          )),
      child: AnimatedSplashScreen(
        nextScreen: MyHomePage(),

        splashTransition: SplashTransition.slideTransition,
        // animationDuration: Duration(seconds: 2),
        duration: 3000,


        splash: SizedBox(

          width: 250.0,
          child: DefaultTextStyle(

            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 30.0,
                color: Colors.white


            ),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,




              animatedTexts: [
                TypewriterAnimatedText('Restaurant pos app',textAlign: TextAlign.center,

                  speed: Duration(milliseconds: 150),



                ),
              ],

            ),
          ),
        ),

        backgroundColor: Colors.transparent,

      ),
    );
  }
  }

