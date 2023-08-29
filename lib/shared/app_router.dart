
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/root_app.dart';
import '../presentation/screens/splash_screen.dart';
abstract class AppRouter {
  static const login='/login';
  static const splash='/splash';
  static const KApprouter='/KApprouter';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, State) =>  RootApp()),
    GoRoute(path: KApprouter, builder: (context, State) =>  RootApp ()),

  ]);

}