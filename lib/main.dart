import 'package:flutter/material.dart';
import 'package:untitled/shared/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Barlow',
        canvasColor: Color(0xff1F1F1F),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
    //background color for app
      ),
    );
  }
}

