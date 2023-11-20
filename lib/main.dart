import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

import 'medium.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DemoClass()//const MyHomePage(title: 'Flutter Demo Home Page'),
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
String result='';


  @override
  void initState() {
    PhonePePaymentSdk.init('UAT', '7311a215-d674-4523-8db4-22559dc2eb3e', 'M1SXCJLSKZN8', true)
        .then((val) => {
      setState(() {
        result = 'PhonePe SDK Initialized - $val';
      })
    })
        .catchError((error) {
     print("0000000000000$error");
      return <dynamic>{};
    });
    super.initState();
  }



void doTrans(){
    // var body111={
    //   "merchantId": "M1SXCJLSKZN8",
    //   "merchantTransactionId": "transaction_123",
    //   "merchantUserId": "90223250",
    //   "amount": 1000,
    //   "mobileNumber": "9999999999",
    //   "callbackUrl": "https://webhook.site/callback-url",
    //   "paymentInstrument": {
    //     "type": "UPI_INTENT",
    //     "targetApp": "com.phonepe.app"
    //   },
    //   "deviceContext": {
    //     "deviceOS": "ANDROID"
    //   }
    // };
    var body='ewogICAgICAibWVyY2hhbnRJZCI6ICJNRVJDSEFOVFVBVCIsCiAgICAgICJtZXJjaGFudFRyYW5zYWN0aW9uSWQiOiAidHJhbnNhY3Rpb25fMTIzIiwKICAgICAgIm1lcmNoYW50VXNlcklkIjogIjkwMjIzMjUwIiwKICAgICAgImFtb3VudCI6IDEwMDAsCiAgICAgICJtb2JpbGVOdW1iZXIiOiAiOTk5OTk5OTk5OSIsCiAgICAgICJjYWxsYmFja1VybCI6ICJodHRwczovL3dlYmhvb2suc2l0ZS9jYWxsYmFjay11cmwiLAogICAgICAicGF5bWVudEluc3RydW1lbnQiOiB7CiAgICAgICAgInR5cGUiOiAiVVBJX0lOVEVOVCIsCiAgICAgICAgInRhcmdldEFwcCI6ICJjb20ucGhvbmVwZS5hcHAiCiAgICAgIH0sCiAgICAgICJkZXZpY2VDb250ZXh0IjogewogICAgICAgICJkZXZpY2VPUyI6ICJBTkRST0lEIgogICAgICB9CiAgICB9';
  try {
    var response = PhonePePaymentSdk.startPGTransaction(
        body, 'callback', 'checksum', {}, 'apiEndPoint', 'packageName');
    response
        .then((val) => {
      setState(() {
        result = val.toString();
      })
    })
        .catchError((error) {
      //handleError(error);
      return <dynamic>{};
    });
  } catch (error) {
    //handleError(error);
  }
}



  void _incrementCounter() {
    doTrans();
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
