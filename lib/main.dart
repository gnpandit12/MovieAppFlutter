import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/views/bookmark_screen.dart';
import 'package:flutter_app/views/home_screen.dart';
import 'package:flutter_app/views/star_screen.dart';

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

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movie App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: CupertinoColors.white,
              fontSize: 18
          ),
        ),
      ),

      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context) => HomeScreen()));
          },
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black
            ),
          ),
        ),
      )

    );
  }






}

