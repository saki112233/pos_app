import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/bottom_nav/product_details_bottom.dart';

import 'package:pos_application/providers/start_provider.dart';
import 'package:provider/provider.dart';


class Start extends StatefulWidget {
  int j;


  Start(this.j);

  @override
  _StartState createState() => _StartState(j);
}

class _StartState extends State<Start> {
int j;

_StartState(this.j);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.height * 0.01),
      child: GridView.builder(

        scrollDirection: Axis.vertical,
        itemCount:
            Provider.of<StartProvider>(context, listen: false).category[j].item.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 1),
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            setState(() {
              // if (Provider.of<StartProvider>(context, listen: false)
              //         .items[i]
              //         .itemSelectStatus ==
              //     true) {
              //   Provider.of<StartProvider>(context, listen: false)
              //       .items[i]
              //       .itemSelectStatus = false;
              //   Provider.of<itemProvider>(context, listen: false).removeItem(
              //       Provider.of<StartProvider>(context, listen: false)
              //           .items[i]);
              // } else {
              //   Provider.of<StartProvider>(context, listen: false)
              //       .items[i]
              //       .itemSelectStatus = true;
              //   Provider.of<itemProvider>(context, listen: false).addItem(
              //       Provider.of<StartProvider>(context, listen: false)
              //           .items[i]);
              // }

              showModalBottomSheet(
                isScrollControlled: true,


                  backgroundColor: Colors.transparent,

                  context: context,
                  builder: (BuildContext context) {
                    return ProductDetails(Provider.of<StartProvider>(context,listen: false).category[j].item[i]);
                  });


            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Provider.of<StartProvider>(context, listen: false)
                                  .category[j].item[i]
                                  .itemSelectStatus ==
                              false
                          ? Colors.white.withOpacity(0.2)
                          : Colors.purple.shade700,
                      Provider.of<StartProvider>(context, listen: false)
                                  .category[j].item[i]
                                  .itemSelectStatus ==
                              false
                          ? Colors.white.withOpacity(0.5)
                          : Colors.purple.shade700,
                      Provider.of<StartProvider>(context, listen: false)
                                  .category[j].item[i]
                                  .itemSelectStatus ==
                              false
                          ? Colors.white.withOpacity(0.2)
                          : Colors.purple.shade700,
                    ])),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.003,
                  horizontal: MediaQuery.of(context).size.height * 0.003),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                    child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Provider.of<StartProvider>(context,
                                  listen: false)
                                  .category[j].item[i]
                                  .itemImage,
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                          )),

                    ),
                    // IconButton(
                    //   color: Colors.green,
                    //   alignment: Alignment.topRight,
                    //   onPressed: () {
                    //
                    //   },
                    //   icon: Icon(
                    //     Icons.info_outlined,
                    //     color: Colors.blue.withOpacity(1),
                    //     size: 35,
                    //   ),
                    // ),
                ],
              )


                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                          Provider.of<StartProvider>(context, listen: false)
                              .category[j].item[i]
                              .itemName,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        '${Provider.of<StartProvider>(context, listen: false).category[j].item[i].itemPrice.toString()}\$',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
