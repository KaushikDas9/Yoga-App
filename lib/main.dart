import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MaterialApp(
      home: myApp(),
    ),
  );
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int count = 0;
  final model = myModel();
  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<myModel>(context, listen: false);

    return
        
        ChangeNotifierProvider(
          create: (_) => myModel() ,
          child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                            count += 1;
                          });
                  },
                  child: Consumer<myModel>(builder: (context, value, child) {
                    return Text(value.modelCount.toString());
                  }, ) ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Value:"),
                    Text(count.toString()),
                     Container(
                        child: Consumer<myModel>(
                          builder: (_, value, __) {
                            return Text(value.modelCount.toString());
                          },
                        ),
                      ),
                    
                    Consumer<myModel>(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: () {
                            value.doSomething();
                          },
                          child: Text(" Change value"));
                      },
                      
                    ),
                  ],
                ),
              )),
        );
  }

  // Stream<myModel> getModel() {
  //   return Stream<myModel>.periodic(
  //       Duration(seconds: 1), (x) => myModel(someValue: '$x')).take(300);
  // }
}

class myModel with ChangeNotifier {
  String someValue = "sjb";
  // myModel({required this.someValue});
  var modelCount = 0;
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
    print("Noty");
  }

  Future<void> doSomething() async {
    modelCount = modelCount + 1;
    notifyListeners();
    print(modelCount.toString());
  }
}
