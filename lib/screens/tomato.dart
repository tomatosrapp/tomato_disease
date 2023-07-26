import 'package:flutter/material.dart';

class Tomato extends StatelessWidget {
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
                'assets/images/tomato.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomato',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A tomato is a fruit from the nightshade family native to South America, but it is also used as a vegetable in cooking. Tomatoes are a good source of several vitamins and minerals, including vitamin C, potassium, and lycopene, an antioxidant that may help reduce the risk of some types of cancer.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tomato facts:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '✔️ Tomatoes were first domesticated in Mexico.\n✔️ The largest tomato ever grown weighed 7 pounds and 12 ounces.\n✔️ Tomatoes are the state vegetable of New Jersey.\n✔️ Tomato plants are native to South America.\n✔️ Tomatoes are used in many different types of cuisine, including Italian, Mexican, and Indian.',
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
