

import 'items.dart';

class CategoryModel{

  String catName;
  List<Items> item ;

  CategoryModel({required this.catName,required this.item});
  factory CategoryModel.fromJson(Map<String,dynamic> json){
    List<dynamic> ii = json['items'];


    return CategoryModel(catName: json['name'], item: ii.map((tagJson) => Items.fromJson(tagJson)).toList(),);
  }

}