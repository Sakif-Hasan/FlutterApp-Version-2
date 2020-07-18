import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Home/emergency.dart';
import 'package:flutter_v2/screens/Home/profile.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}


class _MapState extends State<Map> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    Text('Index 0: Dashboard',style: optionStyle,),
    Text('Index 1: Business',style: optionStyle,),
    Text('Index 2: School',style: optionStyle,),

  ];

  void _onItemTapped(int index) {
    setState(() {
      if(index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
      }else if(index == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Emergency()));
      }else if(index == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            title: Text('Emergency'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
