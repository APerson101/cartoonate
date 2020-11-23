import 'package:cartoonate/bloc_logic/load_profile/bloc/loadprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'history.dart';
import 'home.dart';
import 'login.dart';
import 'profile.dart';
import 'socialMedia.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoadprofileBloc>(create: (context) {
        var l = LoadprofileBloc();
        l.add(LoadProfile());
        return l;
      })
    ], child: Content());
  }
}

class Content extends StatelessWidget {
  String va = 'Logout';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadprofileBloc, LoadprofileState>(
        listener: (context, state) {
      if (state is LogOut) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    }, builder: (context, state) {
      return Container(
          // color: Color(0xFFbebebe),
          child: Padding(
              padding: EdgeInsets.only(
                  top: 30.0, bottom: 30.0, left: 60.0, right: 60.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  elevation: 5.0,
                  child: Scaffold(
                      appBar: AppBar(
                          actions: [
                            RaisedButton(
                                child: Text('Logout',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                                onPressed: () {
                                  BlocProvider.of<LoadprofileBloc>(context)
                                      .add(Logout());
                                }),
                          ],
                          title: const Text('Cartoonate'),
                          backgroundColor: Color(0xFF333333)),
                      body: Container(
                          // color: Colors.amberAccent,
                          child: PersistentTabView(
                        screens: buildScreens(),
                        items: _navBarsItems(),
                        confineInSafeArea: true,
                        backgroundColor: Color(0xFF333333),
                        handleAndroidBackButtonPress: true,
                        resizeToAvoidBottomInset: true,
                        stateManagement: true,
                        hideNavigationBarWhenKeyboardShows: true,
                        margin: EdgeInsets.all(10.0),
                        popActionScreens: PopActionScreensType.once,
                        bottomScreenMargin: 0.0,
                        decoration: NavBarDecoration(
                            // colorBehindNavBar: Color(0xFFf4d47c),
                            borderRadius: BorderRadius.circular(30.0)),
                        popAllScreensOnTapOfSelectedTab: true,
                        itemAnimationProperties: ItemAnimationProperties(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease,
                        ),
                        // screenTransitionAnimation: ScreenTransitionAnimation(
                        //   animateTabTransition: true,
                        //   curve: Curves.linear,
                        //   duration: Duration(milliseconds: 200),
                        // ),
                        navBarStyle: NavBarStyle.style9,
                      ))))));
    });
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: Color(0x2069e0),
        inactiveColor: Colors.grey,
        activeContentColor: Colors.white,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.history),
      //   title: ("History"),
      //   activeColor: Color(0x2069e0),
      //   inactiveColor: Colors.grey,
      //   activeContentColor: Colors.white,
      // ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.share),
        title: ("Social"),
        activeColor: Color(0x2069e0),
        inactiveColor: Colors.grey,
        activeContentColor: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColor: Color(0x2069e0),
        inactiveColor: Colors.grey,
        activeContentColor: Colors.white,
      ),
    ];
  }

  List<Widget> buildScreens() {
    return [
      Home(),
      // History(),
      Social(),
      Profile(),
    ];
  }
}
