import 'package:flutter/material.dart';

// TODO: Make a home clone from the github app

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: NetworkImage("https://i.redd.it/6onq25y0sh311.jpg"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.blue),
            onPressed: () => print("+"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.blue,
        currentIndex: _currentstate,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Explore'))
        ],
        onTap: (index) {
          setState(() {
            _currentstate = index;
          });
        },
      ),
    );
  }
}
