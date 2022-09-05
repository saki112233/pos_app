import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/models/items.dart';
import 'package:pos_application/providers/item_provider.dart';
import 'package:provider/provider.dart';

class ListTwo extends StatefulWidget {


  @override
  _ListTwoState createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {

  totalPrice() {
    double totalPrice = 0;
    for (int i = 0;
        i < Provider.of<itemProvider>(context, listen: false).items.length;
        i++) {
      totalPrice = totalPrice +
          Provider.of<itemProvider>(context, listen: false).items[i].itemPrice *
              Provider.of<itemProvider>(context, listen: false)
                  .items[i]
                  .itemQuantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    method(int i) {
      return Provider.of<itemProvider>(context, listen: false)
              .items[i]
              .itemQuantity *
          Provider.of<itemProvider>(context, listen: false).items[i].itemPrice;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2b5876),
            Color(0xff4e4376),
          ],
        ),
      ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'List of Items',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Product',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                            ),
                            flex: 5,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Unit',
                                style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Qty',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                            ),
                            flex: 4,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Amount',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 23,
                                    color: Colors.white),
                              ),
                            ),
                            flex: 4,
                          )
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 0.5)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:
                            Provider.of<itemProvider>(context, listen: false)
                                .items
                                .length,
                        itemBuilder: (context, i) => Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    Provider.of<itemProvider>(context,
                                            listen: false)
                                        .items[i]
                                        .itemName,
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 23,
                                        color: Colors.white),
                                  ),
                                ),
                                flex: 5,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${Provider.of<itemProvider>(context, listen: false).items[i].itemPrice.toString()}',
                                    style: GoogleFonts.lato(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if(Provider.of<itemProvider>(context,listen: false).items[i].itemQuantity!=1){Provider.of<itemProvider>(context,listen: false).items[i].itemQuantity--;}

                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Text(
                                      Provider.of<itemProvider>(context,
                                              listen: false)
                                          .items[i]
                                          .itemQuantity
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 23,
                                          color: Colors.white),
                                    ),
                                    IconButton(onPressed: (){
                                      setState(() {
                                       Provider.of<itemProvider>(context,listen: false).items[i].itemQuantity++;
                                      });



                                    }, icon:  Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: Colors.white,size: 40,
                                    ),),
                                  ],
                                ),
                                flex: 4,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${method(i).toString()}',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 23,
                                        color: Colors.white),
                                  ),
                                ),
                                flex: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.45,
                            right: MediaQuery.of(context).size.height * 0.1),
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        )),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('')),
                                  flex: 5,
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('')),
                                  flex: 4,
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'total',
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 23,
                                            color: Colors.white),
                                      )),
                                  flex: 4,
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        totalPrice().toString(),
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 23,
                                            color: Colors.white),
                                      )),
                                  flex: 4,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 50,
                                right: 50,
                                top: MediaQuery.of(context).size.height * 0.07),
                            child: AnimatedButton(
                              animationDuration: Duration(seconds: 1),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.7,
                              text: 'Confirm Order',
                              isReverse: true,
                              selectedTextColor: Colors.white,
                              transitionType: TransitionType.LEFT_TO_RIGHT,
                              textStyle: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300),
                              backgroundColor: Colors.transparent,
                              selectedGradientColor: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purple.shade700,
                                    Colors.purple.shade700,
                                    Colors.purple.shade700,
                                  ]),
                              borderColor: Colors.white,
                              borderRadius: 50,
                              borderWidth: 1,
                              onPress: () {
                                setState(() {
                                  // if(Provider.of<itemProvider>(context,listen: false).items[i].itemSelectStatus==false){
                                  //   Provider.of<itemProvider>(context,listen: false).items[i].itemSelectStatus==true;
                                  // }
                                });

                                // bool popupIsActive = true;
                                //
                                // Future.delayed(Duration(seconds: 1), () {
                                //   if (popupIsActive) Navigator.of(context).pop();
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Text('data'), Text('10')
