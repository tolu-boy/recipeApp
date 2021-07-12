import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/DataModel/authentication_service.dart';
import 'package:recipe/NewRecipe.dart';
import 'package:recipe/Screens/AddRecipe.dart';
import 'package:recipe/Screens/search.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

 AnimationController percentageAnimationController;
  TabController _tabController;
  @override
  void initState() {
        _tabController = new TabController(length: 3, vsync: this);

    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.grey[300],
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                 setState(() {
      _tabController.index = 0;
    });
              },
              child: Icon(
                FontAwesomeIcons.home,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
               setState(() {
      _tabController.index = 1;
    });
              },
              child: Icon(FontAwesomeIcons.plusCircle),
            ),
            GestureDetector(
              onTap: (){
                 setState(() {
      _tabController.index = 2;
    });
              },
              child: Icon(
                FontAwesomeIcons.search,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthenticationService>().signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
              },
              child: Icon(FontAwesomeIcons.signOutAlt),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 40),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(FontAwesomeIcons.bell)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Make your own food, \n stay at home",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  new TabBar(
                                  controller: _tabController,

                    isScrollable: true,
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0 / 3),
                          // width: size.width * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "New Recipes".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        // text: "New Recipes".toUpperCase(),
                      ),
                      Tab(
                        text: "Add Recipes".toUpperCase(),
                      ),
                      Tab(
                        text: "Search".toUpperCase(),
                      ),
                    ],
                    labelColor: Colors.black,
                    indicator: DotIndicator(
                      color: Colors.black,
                      distanceFromCenter: 16,
                      radius: 3,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    unselectedLabelColor: Colors.black.withOpacity(0.3),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                                controller: _tabController,

                      children: <Widget>[
                        NewRecipe(),
                        AddRecipe(),
                        Search(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
