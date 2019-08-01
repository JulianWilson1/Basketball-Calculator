import 'package:flutter/material.dart';
import 'main.dart';
import 'auth.dart';
import 'package:provider/provider.dart';
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
           SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.white,
              child: Text("Logout"),
              onPressed: () async {
                await Provider.of<AuthService>(context).logout();

                  //Navigator.pushReplacementNamed(context, "/");
              })
         ],
       ),
     ),
   );
 }
}
