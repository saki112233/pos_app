import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/providers/index_provider.dart';
import 'package:pos_application/providers/start_provider.dart';
import 'package:pos_application/tab_nav/start.dart';

import 'package:provider/provider.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {




   int isSelected = 0;

  // _onSelected(int index) {
  //   setState(() => isSelected = index);
  // }


  Color? color1 = const Color(0xff7ed7f5);
  Color? color2 = Colors.white;
  Color? color3 = Colors.white;
  Color? color4 = Colors.white;

  String title = '';

  late TabController _tabController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {




    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                  color: Colors.purple.shade700,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                            itemCount: Provider.of<StartProvider>(context,listen: false).category.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => Ink(

                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Provider.of<IndexProvider>(context,listen:false).change(i);
                                  });

                                },
                                child: Container(
                                  child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                                      child: BackdropFilter(


                                        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                                        child: Container(

                                            height: MediaQuery.of(context).size.height*0.1,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                                              color:Provider.of<IndexProvider>(context,listen:false).index!=null && Provider.of<IndexProvider>(context,listen:false).index==i?Colors.indigo.withOpacity(0.4): Colors.white.withOpacity(0.1),
                                            )),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height*0.1,



                                      child: Center(
                                        child: Text(Provider.of<StartProvider>(context,listen: false).category[i].catName,style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: Provider.of<IndexProvider>(context,listen:false).index!=null && Provider.of<IndexProvider>(context,listen:false).index==i?25:20,
                                            fontWeight: FontWeight.w300
                                        ),),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,

                                      ),
                                    )
                                  ],
                                ),),
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(

                child: Consumer<IndexProvider>(


                    builder: (context,value,child){

                      return value.index%4==0?Start(value.index):value.index%3==0?   Container(child: Start(value.index)):value.index%2==0? Container(child: Container(
                        child: Start(value.index),
                      ),):Container(child: Container(child: Container(child: Start(value.index))),);
                    },

              ),
              ),],
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// ss = 2;
// });
// },
// child: Stack(
// children: [
// ClipRRect(
// child: BackdropFilter(
// filter:
// ImageFilter.blur(sigmaY: 15, sigmaX: 15),
// child: Container(
// height: MediaQuery.of(context).size.height *
// 0.1,
// width: double.infinity,
// decoration: BoxDecoration(
// color: ss == 2
// ? Colors.indigo.withOpacity(0.4)
// : Colors.white.withOpacity(0.1),
// ),
// ),
// ),
// ),
// Container(
// width: double.infinity,
// height:
// MediaQuery.of(context).size.height * 0.1,
// child: Center(
// child: Text(
// 'Main Course',
// style: GoogleFonts.lato(
// color: Colors.white,
// fontSize: ss == 2 ? 25 : 20,
// fontWeight: FontWeight.w300),
// ),
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.transparent,
// ),
// )
// ],
// ),
// ),




