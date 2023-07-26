import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:Tomatect/screens/detection.dart';
import 'package:Tomatect/screens/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color(0xFFB1EBCC), // Set the background color of the AppBar
        elevation: 0, // Remove the shadow
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/images/logo.png',
                width: 24, // Set the desired width of the image
                height: 24, // Set the desired height of the image
              ),
              onPressed: () {
                // Implement the desired action for the image button
              },
            ),
          ),
        ],
      ),
      drawer: NavBar(), // Add the NavBar widget to the drawer property
      body: Container(
        color: Color(0xFFB1EBCC), // Set the background color of the page
        child: Center(
          child: Container(
            width: screenWidth * 0.88, // Set width as 88% of the screen width
            height:
                screenHeight * 0.75, // Set height as 75% of the screen height
            decoration: BoxDecoration(
              color: Colors.white, // Set the color of the box as white
              borderRadius: BorderRadius.circular(
                  55.0), // Set the border radius to 55 in every corner
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                padding:
                    EdgeInsets.only(top: 20.0), // Set the margin at the top
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Align(
                      alignment: Alignment
                          .center, // Align only this text to the center
                      child: Text(
                        'Welcome to Tomatect!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '— With just one photo, Tomatect can detect and identify the disease of the tomato, predict its survival rate, and offer treatments for the said disease.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 100.0), // Add a space below the text
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Align images horizontally
                      children: [
                        Image.asset(
                          'assets/images/image1.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/images/image2.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/images/image3.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/images/image4.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'assets/images/image5.png',
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0), // Add a space below the images
                    Align(
                      alignment:
                          Alignment.center, // Align the button to the center
                      child: Container(
                        width: 200.0, // Set the width of the button
                        height: 50.0, // Set the height of the button
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF6BD99E), // Set the button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25.0), // Set the border radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detection()),
                            );
                          },
                          child: Text(
                            'Start Now',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
