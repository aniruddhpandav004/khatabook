import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          primary: false,
          toolbarHeight: 65,
          backgroundColor: Color(0xff4137F0),
          centerTitle: true,
          title: Text('History'),
        ),
      ),
    );
  }
}
