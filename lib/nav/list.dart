import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pos_application/providers/item_provider.dart';
import 'package:provider/provider.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff2b5876),
            Color(0xff4e4376),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.indigo.shade900.withOpacity(0.2),
                    Colors.deepPurple.withOpacity(0.2)
                  ]),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(10))),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'List of Items',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    Text(
                      'Bills',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          Provider.of<itemProvider>(context, listen: false)
                              .items
                              .length,
                      itemBuilder: (context, i) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          gradient: RadialGradient(
                              center: Alignment.bottomCenter,
                              radius: 2,
                              colors: [
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.1),
                              ]),
                        ),
                        constraints: BoxConstraints.tightFor(
                            height: MediaQuery.of(context).size.height * 0.2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                    horizontal:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Provider.of<itemProvider>(
                                                  context,
                                                  listen: false)
                                              .items[i]
                                              .itemImage,
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Provider.of<itemProvider>(context,
                                              listen: false)
                                          .items[i]
                                          .itemName,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${Provider.of<itemProvider>(context, listen: false).items[i].itemPrice.toString()}\$',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Quantity',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (Provider.of<itemProvider>(
                                                        context,
                                                        listen: false)
                                                    .items[i]
                                                    .itemQuantity !=
                                                1) {
                                              Provider.of<itemProvider>(context,
                                                      listen: false)
                                                  .quantityMinus(i);
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        Provider.of<itemProvider>(context,
                                                listen: false)
                                            .items[i]
                                            .itemQuantity
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            Provider.of<itemProvider>(context,
                                                    listen: false)
                                                .quantityPlus(i);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.control_point_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              MediaQuery.of(context).size.height * (0.01)),
                      child: const VerticalDivider(
                          color: Colors.white, width: 20)),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  color: Colors.white.withOpacity(0.1)),
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
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView.builder(
                              itemCount: Provider.of<itemProvider>(context,
                                      listen: false)
                                  .items
                                  .length,
                              itemBuilder: (context, i) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                    horizontal:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                child: Container(
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
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                        flex: 5,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            Provider.of<itemProvider>(context,
                                                    listen: false)
                                                .items[i]
                                                .itemQuantity
                                                .toString(),
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                        flex: 4,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${method(i).toString()}',
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
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
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height * 0.3),
                            child: Divider(
                              color: Colors.white.withOpacity(0.1),
                              thickness: 1,
                            ),
                          ),
                          Expanded(
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
                                    child: Text(
                                      'total',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                  flex: 4,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      totalPrice().toString(),
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                  flex: 4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.015,
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.015),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: Colors.white.withOpacity(0.1)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<itemProvider>(context,listen: false).sdsd();
                                      });
                                    },
                                    child: Text(
                                      'Confirm Order',
                                      style: GoogleFonts.lato(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.05,
                top: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
