
  import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/SizeConfig.dart';
import 'package:flutter_app/views/movie_details_screen.dart';
  import 'package:http/http.dart' as http;



  Color bottomNavBarColor = new Color(0xff181617);
  Color bottomNavBarActiveColor = new Color(0xffc73257);
  Color bottomNavBarUnselectedColor = new Color(0xff404040);
  Color tabSelectedColor = new Color(0xffc02f53);

  TabController _tabController;
  bool _isTabSelected = false;

  bool isFirstTabSelected = false;
  bool isSecondTabSelected = false;
  bool isThirdTabSelected = false;

  var _currentIndex = 0;
  var _selectedIndex = 0;

  PageController _pageController;
  int _pageIndex = 0;

  List data;


class HomeScreen extends StatefulWidget {
    @override
    _HomeScreenState createState() => _HomeScreenState();
  }


  class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin {

    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _tabController = TabController(vsync: this, length: 3);
      _pageController = PageController(initialPage: _pageIndex);
      _tabController.addListener(_handleTabSelection);
      this.getJSONData();

    }

    void _handleTabSelection() {
      if (_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            isFirstTabSelected = true;
            isSecondTabSelected = false;
            isThirdTabSelected = false;
            break;
          case 1:
            isFirstTabSelected = false;
            isSecondTabSelected = true;
            isThirdTabSelected = false;
            break;
          case 2:
            isFirstTabSelected = false;
            isSecondTabSelected = false;
            isThirdTabSelected = true;
            break;
        }
      }
    }


    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CupertinoColors.black,
            leading: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.account_circle,
                color: CupertinoColors.white,
              ),
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: CupertinoColors.white,
                  fontSize: 18
              ),
            ),
            bottom: TabBar(
              isScrollable: false,
              onTap: onTabBarClicked,
              controller: _tabController,
              indicator: BoxDecoration(
                  color: CupertinoColors.black
              ),
              labelColor: CupertinoColors.white,
              unselectedLabelColor: new Color(0xff2d2d2d),
              labelStyle: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold
              ),
              indicatorPadding: EdgeInsets.all(10),
              labelPadding: EdgeInsets.all(10),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                new Container(
                  width: 100,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(5)),
                    color: isFirstTabSelected ? tabSelectedColor : Colors.black,
                  ),
                  child: new Tab(
                    text: "Movies",
                  ),
                ),

                new Container(
                  width: 100,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(5)),
                    color: isSecondTabSelected ? tabSelectedColor : Colors.black,
                  ),
                  child: new Tab(
                    text: "Shows",
                  ),
                ),

                new Container(
                  width: 100,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(5)),
                    color: isThirdTabSelected ? tabSelectedColor : Colors.black,
                  ),
                  child: new Tab(
                    text: "Music",
                  ),
                ),

              ],
            ),
          ),

          body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: bottomNavBarColor,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: bottomNavBarActiveColor,
            unselectedItemColor: bottomNavBarUnselectedColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  title: Text(
                    '',
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star,
                    size: 25,
                  ),
                  title: Text(
                    '',
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark,
                    size: 25,
                  ),
                  title: Text(
                    '',
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    size: 25,
                  ),
                  title: Text(
                    '',
                  )
              )
            ],
            onTap: _onTap,
            currentIndex: _currentIndex,
          ), // This trailing comma
          // makes auto-formatting nicer for build methods.
        ),
      );
    }


    void onPageChanged(int page) {
      setState(() {
        _pageIndex = page;
      });
    }

    void _onTabTapped(int index) {
      _pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
    }

    void onTabBarClicked(int index){
      setState(() {

      });
    }

    Widget newWidget(String text) {
      return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 50,
        color: CupertinoColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                  fontSize: 30
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: _buildListView(),
            )
          ],
        ),
      );
    }



    Widget movies() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

            ],
          )
          ,
        ),
      );
    }

    Widget shows() {
      return Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical * 100,
        color: CupertinoColors.black,
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    newWidget("NEW"),
                    newWidget("POPULAR"),
                    newWidget("TRENDING"),
                  ],
                ),
              )
          );
        }
        ),
      );
    }

    Widget music() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

            ],
          )
          ,
        ),
      );
    }


    _onTap(int tabIndex) {
      switch (tabIndex) {
        case 0:
          _navigatorKey.currentState.pushReplacementNamed("Home");
          break;
        case 1:
          _navigatorKey.currentState.pushReplacementNamed("Star");
          break;
        case 2:
          _navigatorKey.currentState.pushReplacementNamed("Bookmark");
          break;
        case 3:
          _navigatorKey.currentState.pushReplacementNamed("Menu");
          break;
      }
      setState(() {
        _currentIndex = tabIndex;
      });
    }

    Route<dynamic> generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case "Star":
          return MaterialPageRoute(builder: (context) => Container(color: Colors.white,child: Center(child: Text("Star"))));
        case "Bookmark":
          return MaterialPageRoute(builder: (context) => Container(color: Colors.white,child: Center(child: Text("Bookmark"))));
        case "Menu":
          return MaterialPageRoute(builder: (context) => Container(color: Colors.white,child: Center(child: Text("Menu"))));
        case "Home":
          return MaterialPageRoute(builder: (context) =>
              TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  movies(),
                  shows(),
                  music()
                ],
              )
          );
        default:
          return MaterialPageRoute(builder: (context) =>
              TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  movies(),
                  shows(),
                  music()
                ],
              )
          );
      }
    }

    Future<String> getJSONData() async {
      var response = await http.get(
        // Encode the url
          Uri.encodeFull("http://www.omdbapi.com/?s=Movies&apikey=5661d041"),
          // Only accept JSON response
          headers: {"Accept": "application/json"}
      );

      setState(() {
        // Get the JSON data
        data = json.decode(response.body)['Search'];
      });

      return "Successfull";
    }


    Widget _buildListView() {
      return Container(
        height: SizeConfig.safeBlockVertical * 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(5.0),
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  String title = data[index]['Title'].toString();
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) {
                        return MovieDetailsScreen(title);
                      },
                    ),
                  );
                },
                child: _buildImageColumn(data[index]),
              );
            }
        ),
      );
    }



    Widget _buildImageColumn(dynamic item) =>
        Container(
          width: 150,
      decoration: BoxDecoration(
          color: Colors.white54
      ),
      margin: const EdgeInsets.all(10),
      child: new CachedNetworkImage(
        imageUrl: item['Poster'],
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
        fadeOutDuration: new Duration(seconds: 1),
        fadeInDuration: new Duration(seconds: 3),
      )
    );

}



