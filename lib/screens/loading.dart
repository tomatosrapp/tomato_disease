import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _hasInternet = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    checkInternetConnection();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        _hasInternet = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, '/other_page');
    } else {
      _controller.stop();
      await Future.delayed(Duration(seconds: 2));
      checkInternetConnection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150.0,
              width: 150.0,
            ),
            SizedBox(height: 50.0),
            SpinKitWave(
              color: Colors.green,
              size: 50.0,
              controller: _controller,
              duration: Duration(milliseconds: 1200),
            ),
            SizedBox(height: 10.0),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 30.0),
            if (!_hasInternet)
              Text(
                'Waiting for internet connection...',
                style: TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }
}
