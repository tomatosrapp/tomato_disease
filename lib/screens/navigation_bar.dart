import 'package:flutter/material.dart';
import 'package:Tomatect/screens/tomato.dart';
import 'package:Tomatect/screens/tomato_disease.dart';
import 'package:Tomatect/screens/tomato_survival_rate.dart';
import 'package:flutter/services.dart';

class NavBar extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.05)
          ],
        ),
      ),
      child: Drawer(
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(
                  fontFamily: 'FredokaOne',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/plant.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Tomato'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Tomato(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_library),
              title: Text('Tomato Diseases'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TomatoDisease(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text('Tomato Survival Rate'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TomatoSurvivalRate(),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () => SystemNavigator.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
