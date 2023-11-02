import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class myModel with ChangeNotifier{ 
     int modelCount=5;
     String? something = "value";
     

      void doSomething() { 
      modelCount += 1 ;
       
      something = "value changed";  
      print(something);
      print(modelCount.toString());
      notifyListeners();
     } 
  }