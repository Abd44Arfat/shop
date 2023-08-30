
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/Auth/login_screen.dart';
import '../presentation/screens/Auth/register_screen.dart';
import '../presentation/screens/root_app.dart';
import '../presentation/screens/search_screen.dart';
import '../presentation/screens/splash_screen.dart';
abstract class AppRouter {
  static const login='/login';
  static const register='/register';
  static const splash='/splash';
  static const KApprouter='/KApprouter';
  static const search='/search';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, State) =>  SearchResultsScreen()),
    GoRoute(path: KApprouter, builder: (context, State) =>  RootApp ()),
    GoRoute(path: search, builder: (context, State) =>  SearchResultsScreen()),
    GoRoute(path: login, builder: (context, State) =>  LoginScreen()),
    GoRoute(path: register, builder: (context, State) =>  RegisterScreen()),

  ]);

}