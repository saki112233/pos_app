import 'package:flutter/cupertino.dart';

class Items{
  AssetImage itemImage;
  String itemName;
  double itemPrice;
  bool itemSelectStatus;
  int itemQuantity;


  Items({required this.itemImage,required  this.itemName,required  this.itemPrice,required this.itemSelectStatus,required this.itemQuantity});

  factory Items.fromJson(Map<String,dynamic> json){
    return Items(itemImage: AssetImage('images/lemon.jpg'), itemName: json['name'], itemPrice: double.parse(json['itm_price'].toString()), itemSelectStatus: false, itemQuantity: 1, );
  }
}