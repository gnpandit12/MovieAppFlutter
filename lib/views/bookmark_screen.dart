
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkScreen extends StatefulWidget {
    @override
    _BookMarkScreenState createState() => _BookMarkScreenState();
  }

  class _BookMarkScreenState extends State<BookMarkScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.black,
          title: Text(
            "Bookmark",
          ),
        ),
      );
    }
  }
