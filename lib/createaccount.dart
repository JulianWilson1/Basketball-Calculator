import 'package:basketball_calculator/main.dart' as prefix0;
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Login Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

 
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _name = "";
  String _email = "";
  String _username = "";
  String _password = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _nameFilter.addListener(_nameListen);
    _emailFilter.addListener(_emailListen);
    _usernameFilter.addListener(_usernameListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }
  void _usernameListen() {
    if (_usernameFilter.text.isEmpty) {
      _username = "";
    } else {
      _username = _usernameFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.blue[300],
      title: new Text("Create an Account"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextFormField(
              controller: _nameFilter,
              decoration: new InputDecoration(
                labelText: 'Full Name'
              ),
            ),
          ),
          new Container(
            child: new TextFormField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextFormField(
              controller: _usernameFilter,
              decoration: new InputDecoration(
                labelText: 'Username'
              ),
            ),
          ),
          new Container(
            child: new TextFormField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

   _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create Account'),
              onPressed:  () {
                _createAccountPressed();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoApp())
                );
              }
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => prefix0.MyApp())
                );
              },
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _createAccountPressed () {
    print('The user wants to create an account with name $_name, email $_email, username $_username and password $_password');

  }
  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }
}