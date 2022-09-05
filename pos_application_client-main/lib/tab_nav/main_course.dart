import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/bottom_nav/product_details_bottom.dart';
import 'package:pos_application/models/items.dart';
import 'package:pos_application/providers/item_provider.dart';
import 'package:pos_application/providers/main_course_provider.dart';
import 'package:pos_application/models/items.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

class MainCourse extends StatefulWidget {
  const MainCourse({Key? key}) : super(key: key);

  @override
  _MainCourseState createState() => _MainCourseState();
}

class _MainCourseState extends State<MainCourse> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.height * 0.01),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount:Provider.of<MainCourseProvider>(context,listen: false). items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1),
          itemBuilder: (context, i) => GestureDetector(
            onTap: (){
              setState(() {
                // if(Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus==true){
                //   Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus=false;
                //   Provider.of<itemProvider>(context,listen:false).removeItem(Provider.of<MainCourseProvider>(context,listen: false).items[i]);
                // }else{
                //   Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus=true;
                //   Provider.of<itemProvider>(context,listen: false).addItem(Provider.of<MainCourseProvider>(context,listen: false).items[i]);
                // }

                showModalBottomSheet(
                    isScrollControlled: true,


                    backgroundColor: Colors.transparent,

                    context: context,
                    builder: (BuildContext context) {
                      return ProductDetails(Provider.of<MainCourseProvider>(context,listen: false).items[i]);
                    });



              });
            },
            child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus==false?Colors.white.withOpacity(0.2):Colors.purple.shade700,
                          Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus==false?Colors.white.withOpacity(0.5):Colors.purple.shade700,
                          Provider.of<MainCourseProvider>(context,listen: false).items[i].itemSelectStatus==false?Colors.white.withOpacity(0.2):Colors.purple.shade700
                        ]),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.003,
                        horizontal: MediaQuery.of(context).size.height* 0.003),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Provider.of<MainCourseProvider>(context,listen: false).items[i].itemImage,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20))),
                          ),
                          flex: 4,
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                        Expanded(
                          child: Container(
                            child: Text(
                              Provider.of<MainCourseProvider>(context,listen: false). items[i].itemName,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '${Provider.of<MainCourseProvider>(context,listen: false).items[i].itemPrice.toString()}\$',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),flex: 1,
                        )
                      ],
                    ),
                  ),
                ),
          )),
    );
  }
}
