
  import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {

  String mtitle;

  MovieDetailsScreen(String title){
    this.mtitle = title;
  }

    @override
    _MovieDetailsScreenState createState() => _MovieDetailsScreenState(mtitle);
  }

  class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  String mTitle;

  _MovieDetailsScreenState(String mtitle){
    this.mTitle = mtitle;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text(
              mTitle
          ),
        ),
      );
    }
  }
