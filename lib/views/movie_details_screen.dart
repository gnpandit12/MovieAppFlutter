import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/movie_title_store.dart';
import 'package:shared_preferences/shared_preferences.dart';


String mTitle;
LocalStore _localStore = LocalStore();

class MovieDetailsScreen extends StatefulWidget {

    @override
    _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
  }

  class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieTitle();
  }


  getMovieTitle() async {
    Future<dynamic> movieTitle = _localStore.getMovieTitle();
    movieTitle.then((title) {
      mTitle = title;
      print("Movie Title: " + title.toString());
    }, onError: (e) {
      print(e);
    });
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: FutureBuilder<dynamic>(
            future: getMovieTitle(), // async work
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData)
                return Text(
                  snapshot.data,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black,
                      fontSize: 18
                  ),
                );
              else
                return Text(
                  mTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black,
                      fontSize: 18
                  ),
                );
            },
          )
        ),
      );
    }
  }
