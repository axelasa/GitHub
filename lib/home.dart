import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter/pages/account.dart';
import 'package:github_flutter/pages/following.dart';
import 'package:github_flutter/pages/landing.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'bloc/get_followers_bloc.dart';
import 'bloc/get_following_bloc.dart';
import 'bloc/get_profile_bloc.dart';
import 'common/user_simple_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String name = '';
  @override
  void initState() {
    super.initState();
    name = UserSimplePreferences.getUsername()!;
    // BlocProvider.of<GetFollowersBloc>(context).add(GetFollowersInfo(name));
    // BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo(name));
    // Navigator.of(context).pushNamed('/landing');
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Landing();
    switch(_selectedIndex){
      case 0:
        currentWidgetPage = const Landing();
        BlocProvider.of<GetFollowersBloc>(context).add(GetFollowersInfo(name));
        BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo(name));
        break;
        case 1:
        currentWidgetPage = const Following();
        BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo(name));
        BlocProvider.of<GetFollowingBloc>(context).add(GetFollowingInfo(name));
        break;
      case 2:
        currentWidgetPage = const Account();
        break;
      // case 2:
      //   //BlocProvider.of<GetAllCartBloc>(context).add(GetAllCartInfo());
      //   // currentWidgetPage = const GetCartPage();
      //   break;
    }
    return  Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            gap: 10,
            color: Colors.black,
            activeColor: Colors.grey[800],
            tabBackgroundColor: Colors.white12,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(icon: CupertinoIcons.arrow_2_squarepath,
                text: 'Followers',
              ),
              GButton(text: 'Following',
                icon: CupertinoIcons.arrow_uturn_right,
              ),
              GButton(icon: Icons.account_circle_sharp,
                text: 'Account',
              ),
              // GButton(icon: Icons.settings,
              //   text: 'Settings',
              // ),
            ],
          ),
        ),
      ),
      body: currentWidgetPage,
    );
  }
}