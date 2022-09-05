import 'package:flutter/material.dart';
import 'package:pos_application/models/items.dart';

class itemProvider extends ChangeNotifier{
  List<Items> items = [];


  sdsd(){
    items = [];
    notifyListeners();
  }



  addItem(Items item){
    var i =item;
    items.add(item);

    notifyListeners();

  }
  removeItem(Items item){
    items.remove(item);

    notifyListeners();

  }
  quantityPlus(int i){
    items[i].itemQuantity = items[i].itemQuantity + 1;

    notifyListeners();
}
   quantityMinus(int i){
    items[i].itemQuantity=items[i].itemQuantity -1;
   }

   set(){
    items = [];
   }
}