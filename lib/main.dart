import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // appBarTheme: AppBarTheme(color: Colors.blue),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> get createState => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var val = true;
  var bgcolor = Colors.cyan.shade200;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 3,
                    controller: wtcontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter Your weight in KG',
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    maxLength: 1,
                    controller: ftcontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Height (in Feet)',
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    maxLength: 2,
                    controller: incontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Height (in Inch)',
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        var wt = wtcontroller.text;
                        var ft = ftcontroller.text;
                        var inch = incontroller.text;
                        var msg = "";
                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iinch = int.parse(inch);

                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = iwt / (tm * tm);

                          if (iwt <= 120 && ift < 10 && iinch <= 12) {
                            if (bmi > 25) {
                              msg = "You are OverWeight!!";
                              bgcolor = Colors.orange.shade200;
                            } else if (bmi < 18) {
                              msg = "You are UnderWeight!!";
                              bgcolor = Colors.red.shade200;
                            } else {
                              msg = "You are Healthy";
                              bgcolor = Colors.green.shade200;
                            }
                          } else {
                            val = true;
                            msg = "Invalid }Inputs! Please enter valid values.";
                          }

                          setState(() {
                            result =
                                "$msg  \n BMI is ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = " please fill all the required blanks ";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
