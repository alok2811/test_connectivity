import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String connection = "";

  checkConnectivty() async{
    var result = await Connectivity().checkConnectivity();

    switch(result){

      case ConnectivityResult.wifi:
        setState(() {
          connection = " Your mobile is connected with Wifi";
        });
        break;

      case ConnectivityResult.mobile:
        setState(() {
          connection = " Your mobile is connected with mobile Internet";
        });
        break;

      case ConnectivityResult.none:
        setState(() {
          connection = " Your mobile is no Internet Connection";
        });

    }
  }

  @override
  Widget build(BuildContext context) {
    checkConnectivty();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(connection, textAlign: TextAlign.center,
          style:TextStyle(fontSize: 20, fontWeight: FontWeight.w600) ,),
      ),
    );
  }
}


