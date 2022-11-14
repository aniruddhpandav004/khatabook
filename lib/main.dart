import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/screen/view/clientScreen.dart';
import 'package:khatabook/screen/view/dataScreen.dart';
import 'package:khatabook/screen/view/spleshScreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)=> SpleshScreen(),
        'second' : (context)=> DataScreen(),
        'third' : (context)=> ClientScreen(),
      },
    ),
  );
}
