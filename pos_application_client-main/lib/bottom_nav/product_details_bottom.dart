import 'dart:ui';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pos_application/models/items.dart';
import 'package:pos_application/providers/item_provider.dart';
import 'package:pos_application/bottom_nav/showfun.dart';
import 'package:provider/provider.dart';

import '../homepage.dart';


class ProductDetails extends StatefulWidget {
  Items items;

  ProductDetails(this.items);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(items);
}

class _ProductDetailsState extends State<ProductDetails> {
  Items item;

  _ProductDetailsState(this.item);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
            child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                )),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: GestureDetector(onTap: (){
                              setState(() {
                                showDialogFunc(context, item.itemImage);
                              });
                            },
                              child: ImageSlideshow(
                                initialPage: 0,
                                autoPlayInterval: 3000,
                                isLoop: true,
                                children: [
                                  Image(
                                    image: item.itemImage,
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'images/Pizza.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'images/cake.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                                onPageChanged: (v) {},
                              ),
                            ),
                            margin: EdgeInsets.only(left: 50, right: 50),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.itemName,
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30,
                                      color: Colors.white),
                                ),
                                Text('${item.itemPrice.toString()}\$',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 30,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: Colors.white,
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity',
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 30,
                                      color: Colors.white),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (item.itemQuantity != 1) {
                                              item.itemQuantity--;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                      Text(
                                        item.itemQuantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            item.itemQuantity++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_outlined,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
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
                              text: 'Add to Order',
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
                                  if (Provider.of<itemProvider>(context,
                                              listen: false)
                                          .items
                                          .contains(item) ==
                                      false) {
                                    Provider.of<itemProvider>(context,
                                            listen: false)
                                        .addItem(item);
                                    if (item.itemSelectStatus == false) {
                                      item.itemSelectStatus = true;
                                    }
                                  }
                                });

                                bool popupIsActive = true;

                                Future.delayed(Duration(seconds: 1), () {
                                  if (popupIsActive)
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage()));
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: VerticalDivider(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              'description: Plutarch on the passing of oracles—presage to a certain degree the form and tone of the essay, but not until the late 16th century was the flexible and deliberately nonchalant and versatile form of the essay perfected by the French writer Michel de Montaigne. Choosing the name essai to emphasize that his compositions were attempts or endeavours, a groping toward the expression of his personal thoughts and experiences, Montaigne used the essay as a means of self-discovery. His Essais, published in their final form in 1588, are still considered among the finest of their kind. Later writers who most nearly recall the charm of Montaigne include, in England, Robert Burton, though his whimsicality is mPlutarch on the passing of oracles—presage to a certain degree the form and tone of the essay, but not until the late 16th century was the flexible and deliberately nonchalant and versatile form of the essay perfected by the French writer Michel de Montaigne. Choosing the name essai to emphasize that his compositions were attempts or endeavours, a groping toward the expression of his personal thoughts and experiences, Montaigne used the essay as a means of self-discovery. His Essais, published in their final form in 1588, are still considered among the finest of their kind. Later writers who most nearly recall the charm of Montaigne include, in England, Robert Burton, though his whimsicality is m',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// Image(
// image: item.itemImage,
// fit: BoxFit.cover,
// ),