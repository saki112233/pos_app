import 'dart:convert';

import 'package:http/http.dart'as http;
class StartApi{
 Future  getData()async{
     http.Response  response =   await http.get(Uri.parse('http://50.21.176.24/api/category/items'));
     if(response.statusCode==200){
       String loginData = response.body;
       var v = jsonDecode(loginData)['catItems'] as List;
       return v;
     }else{
       return print(response.statusCode);
     }
  }
}