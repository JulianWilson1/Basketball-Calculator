import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {

 @override
 Widget build(BuildContext context) {

   return Scaffold(
     backgroundColor: Colors.blue[300],
     appBar: AppBar(
       // Here we take the value from the MyHomePage object that was created by
       // the App.build method, and use it to set our appbar title.
       title: Text('Settings'),
       backgroundColor: Colors.blue[300],
     ),
     body: Center(
       child: Column(
         children: <Widget>[
           new MaterialButton(
             minWidth: 200,
             color: Colors.white,
             child: Text(
               'Logout',
               style: TextStyle(fontSize: 15),
             ),
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => MyApp())
                 );
               },
           ),
         ],
       ),
     ),
   );
 }
}
