import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier{
  int index = 0;

  change(int i){
    index = i;
    notifyListeners();
  }

}
