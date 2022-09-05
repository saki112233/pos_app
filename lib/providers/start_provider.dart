

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_application/api/startap.dart';
import 'package:pos_application/models/category_model.dart';
import 'package:pos_application/models/items.dart';
import 'package:pos_application/tab_nav/start.dart';


class StartProvider extends ChangeNotifier{
  List<CategoryModel> category = [];

  categoryItem() async{
    var v= await StartApi().getData();

    List cat =  v.map((tagJson) => CategoryModel.fromJson(tagJson)).toList();

    category=[...cat];
    notifyListeners();

  }

  List<Items> items =[
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Chips.jpg'), 'Chips', 2,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 5,false,1),
    // Items(AssetImage('images/Frenchfries.jpg'), 'Frenchfries', 10,false,1),
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 20,false,1),
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Chips.jpg'), 'Chips', 2,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 5,false,1),
    // Items(AssetImage('images/Frenchfries.jpg'), 'Frenchfries', 10,false,1),
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 20,false,1),
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Chips.jpg'), 'Chips', 2,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 5,false,1),
    // Items(AssetImage('images/Frenchfries.jpg'), 'Frenchfries', 10,false,1),
    // Items(AssetImage('images/Bread.jpg'), 'Bread', 5,false,1),
    // Items(AssetImage('images/Pizza.jpg'), 'Pizza', 20,false,1),
    // Items(AssetImage('images/Soup.jpg'), 'Soup', 20,false,1),
  ];

  truevv(var i,j){
    category[j].item[i].itemSelectStatus= true;
    notifyListeners();
  }
  ite(){
    List dds=[];
    for(int i = 0; i<category.length;i++){
      dds.add(StatefulBuilder(builder: (BuildContext context, StateSetter setState){
        return Start(i);
      }));

    }
    return dds;
  }
}