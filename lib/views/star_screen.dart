
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        title: Text(
          "Star",
        ),
      ),
    );
  }
}
