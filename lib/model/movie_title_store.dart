

import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  final String MOVIE_TITLE = "movie_title";

//set data into shared preferences like this
  Future<void> storeMovieTitle(String movieTitle) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.MOVIE_TITLE, movieTitle);
  }

//get value from shared preferences
  Future<String> getMovieTitle() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.MOVIE_TITLE) ?? null;
  }
}