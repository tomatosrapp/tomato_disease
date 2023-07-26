import 'package:flutter/material.dart';

class TomatoSurvivalRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/tomato_survival_rate.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomato Survival Rate',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The survival rate of tomato plants depends on several factors, including average temperature, rainfall, humidity, month, minimum and maximum temperature, production in kilograms, area harvested, and area planted. Tomatoes thrive in warm temperatures ranging from 18-30°C and require a steady supply of moisture. The optimal amount of rainfall for tomatoes is about 25-30 mm per week, and humidity levels should be between 60-90%. The month of planting is also critical for tomato survival, with spring and fall being the most favorable seasons. '
                    '\n\nAdditionally, the minimum and maximum temperatures can affect tomato growth, with temperatures below 10°C or above 35°C being unfavorable for growth. \n\nFinally, the amount of production in kilograms, as well as the size of the area planted and harvested, can affect the overall survival rate of tomato plants. It is important for tomato growers to monitor these factors carefully and take proactive measures to ensure optimal growing conditions for their tomato plants.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
