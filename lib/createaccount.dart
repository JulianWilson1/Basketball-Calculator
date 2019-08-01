import 'package:basketball_calculator/home.dart';
import 'package:basketball_calculator/login.dart' as prefix0;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  String _email;
  String _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text("Create Account"),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      onSaved: (value) => _name = value,
                      decoration: InputDecoration(labelText: "Full Name")),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email")),
                  TextFormField(
                      onSaved: (value) => _password = value,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password")),
                  SizedBox(height: 20.0),
                   new FlatButton(
                    child: new Text('Have and account? Click here to sign in.'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => prefix0.LoginPage())
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("Create Account"),
                    onPressed: () async {
                      // MaterialPageRoute(builder: (context) => TodoApp());
                      // save the fields..
                      final form = _formKey.currentState;
                      form.save();

                      // Validate will return true if is valid, or false if invalid.
                      if (form.validate()) {
                        try {
                          FirebaseUser result =
                              await Provider.of<AuthService>(context).loginUser(
                                  email: _email, password: _password); 
                          print(result);
                        } on AuthException catch (error) {
                          return _buildErrorDialog(context, error.message);
                        } on Exception catch (error) {
                          return _buildErrorDialog(context, error.toString());
                        }
                      }
                    },
                  )
                
                ]))));
  }
  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}