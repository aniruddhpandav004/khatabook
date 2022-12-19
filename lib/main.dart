import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/Screen/view/homeScreen.dart';
import 'package:khatabook/Screen/view/spleshSscreen.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: 'main',
    routes: {
      '/': (context) => SplashScreen(),
      'main': (context) => HomeScreen(),
    },
  ));
}