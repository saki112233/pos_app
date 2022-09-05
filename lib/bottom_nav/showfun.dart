import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
showDialogFunc(context,itemImage){
  return showDialog(
      context: context,
      builder: (context){
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 1,),
              ),
              child: ImageSlideshow(
                initialPage: 0,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image(
                    image: itemImage,
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
              // child: Column(
              //
              //   children: [
              //     ClipRect(
              //       child: Image(image: itemImage,fit: BoxFit.cover,),
              //
              //     )
              //   ],
              // ),
            ),
          ),
        );
      }
  );
}