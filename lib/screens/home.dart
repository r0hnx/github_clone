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
    double height = MediaQuery.of(context).size.height;
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
      body: Container(
        padding: EdgeInsets.all(height * 0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Home",
            style:
                TextStyle(fontSize: height * 0.05, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            "My Work",
            style: TextStyle(fontSize: height * 0.03),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: _myWork()),
              ],
            ),
          ),
        ]),
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

//my Work Widget 
  Widget _myWork() {
    double width = MediaQuery.of(context).size.width;
    return (Column(
      children: [
        _myWorkItem("Issues", Icon(
                Icons.error_outline,
                color: Colors.white,
              ), Colors.green),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem("Pull Requests", Icon(
                Icons.call_merge,
                color: Colors.white,
              ), Colors.blue),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem("Repositories", Icon(
                Icons.filter_none,
                color: Colors.white,
              ), Colors.purple),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem("Organizations", Icon(
                Icons.people_outline,
                color: Colors.white,
              ), Colors.orange),
      ],
    ));
  }

//my work item component
  Widget _myWorkItem(String title,Icon icon,Color color){
   return(
      ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4.0),
                color: color,
              ),
              padding: EdgeInsets.all(4.0),
              child: icon),
          title: Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20.0,
          ),
        )
   );
 }
}
