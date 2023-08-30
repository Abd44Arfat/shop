import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/presentation/screens/home_screen.dart';

import '../../presentation/screens/Auth/login_screen.dart';
import '../../shared/app_router.dart';
import '../../shared/consatnts.dart';

class AuthContainer extends StatefulWidget {
  @override
  _AuthContainerState createState() => _AuthContainerState();

}

class _AuthContainerState extends State<AuthContainer> {

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppConstants.Key_Access_Token);

    if(token != null) {
      // user is logged in, go to home screen
      GoRouter.of(context).go(AppRouter.KApprouter);
      print("#################################################################");
      print(token);
    }
    else {
      // user not logged in, go to login screen
      GoRouter.of(context).go(AppRouter.login);



    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}