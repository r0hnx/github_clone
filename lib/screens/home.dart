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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: NetworkImage("https://i.redd.it/6onq25y0sh311.jpg"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.blue),
            onPressed: () => print("+"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(height * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Home",
              style: TextStyle(
                  fontSize: height * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "My Work",
              style: TextStyle(
                  fontSize: height * 0.03, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: _myWork()),
            Row(children: [
              Expanded(
                child: Text(
                  "Favourites",
                  style: TextStyle(
                      fontSize: height * 0.03, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Edit",
                style: TextStyle(color: Colors.blue),
              )
            ]),
            _favouritesSection(height, width)
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.blue,
        currentIndex: _currentstate,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore')
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
        _myWorkItem(
            "Issues",
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            Colors.green),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem(
            "Pull Requests",
            Icon(
              Icons.call_merge,
              color: Colors.white,
            ),
            Colors.blue),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem(
            "Repositories",
            Icon(
              Icons.insert_invitation,
              color: Colors.white,
            ),
            Colors.purple),
        Divider(
          indent: width * 0.15,
        ),
        _myWorkItem(
            "Organizations",
            Icon(
              Icons.people_outline,
              color: Colors.white,
            ),
            Colors.orange),
      ],
    ));
  }

//my work item component
  Widget _myWorkItem(String title, Icon icon, Color color) {
    double height = MediaQuery.of(context).size.height;
    return (ListTile(
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
        style: TextStyle(fontSize: height * 0.03),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          size: height * 0.03,
        ),
        onPressed: () => print("next"),
      ),
      onTap: () => print("tapped"),
    ));
  }

//favourites section Widget
  Widget _favouritesSection(double height, double width) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromARGB(200, 214, 215, 219),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add favourite repositories here to have quick access at any time, without having to search",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: height * 0.03,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonTheme(
                  minWidth: width * 0.7,
                  child: FlatButton(
                    onPressed: () => print("pressed"),
                    child: Text("Add Favourites"),
                    color: Colors.white,
                  ),
                ),
              ]),
        ));
  }
}
