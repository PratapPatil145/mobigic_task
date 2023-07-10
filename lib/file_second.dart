import 'package:flutter/material.dart';
import 'package:sample/gridscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/mobigic.png',
            width: 400,
            height: 400,
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GridScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
        );
  }
}

