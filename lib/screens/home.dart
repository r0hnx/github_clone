import 'package:flutter/material.dart';

// TODO: Make a home clone from the github app

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentstate=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.blue,
        currentIndex: _currentstate,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label:'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            label:'Notifications',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label:'Explore'
          )
        ],
        onTap: (index){
          setState(() {
            _currentstate=index;
          });
        },
      ),
    );
  }
}
