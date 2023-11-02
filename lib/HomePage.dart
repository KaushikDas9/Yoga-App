import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:yoga_app/ProviderController.dart';
import 'package:yoga_app/main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
 int countProvider = 0;
class _homeState extends State<home> {
  int countNormal = 0;
 
   

  @override
  Widget build(BuildContext context) {
// final countProvider = Provider.of<myModel>(context , listen: true );

print("sob ho66e");
    return ChangeNotifierProvider(
      create: (BuildContext context) => myModel(),

      child: Scaffold(
            floatingActionButton:
                FloatingActionButton(onPressed: () { countNormal += 1 ; setState(() {}); }, child: Icon(Icons.add)),
            body: Container(
              width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Value:"),
                Text(countNormal.toString()),
    
              
                Consumer<myModel> ( builder: (context, value, child) {
                  print("Consumer main to anne do");
                  return  Text(value.modelCount.toString() );
                }, ) ,
    
                ElevatedButton(onPressed: () { myModel().doSomething(); }, child: Text("change Value")),
                
              ],
            )),
          ),
    );
  }

}


