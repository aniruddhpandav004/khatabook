import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? opacityTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 4),);
    opacityTween = Tween<double>(begin: 0,end: 1).animate(_animationController!);
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        return Navigator.pushReplacementNamed(context, 'second');
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: opacityTween!.value,
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/images/khatbook1.png"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "KHATABOOK",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
