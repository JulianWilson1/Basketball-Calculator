// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:basketball_calculator/calculator.dart' as prefix0;

import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
// void main() => runApp(new TodoApp();
// Every component in Flutter is a widget, even the whole app itself

final databaseReference = FirebaseDatabase.instance.reference();
class TodoApp extends StatelessWidget {
  TodoApp(FirebaseUser data);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: new TodoList()
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
  List<String> _todoItems2 = [];
  List<String> _todoItems3 = [];
  List<String> _todoItems4 = [];
  List<String> _todoItems5 = [];



  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _todoItems.add(task));
    }
  }

   void _addTodoItem2(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _todoItems2.add(task));
    }
  }
   
   void _addTodoItem3(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _todoItems3.add(task));
    }
  }
   
   void _addTodoItem4(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _todoItems4.add(task));
    }
  }

     void _addTodoItem5(String task) {
    // Only add the task if the user actually entered something
    if(task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      setState(() => _todoItems4.add(task));
    }
  }



  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Do you want to remove "${_todoItems[index]}"?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              // The alert is actually part of the navigation stack, so to close it, we
              // need to pop it.
              onPressed: () => Navigator.of(context).pop()
            ),
            new FlatButton(
              child: new Text('Remove'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items we have. So, we need to check the index is OK.
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }
  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
      title: new Text(todoText),
      onTap: () => _promptRemoveTodoItem(index)
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text('Your Numbers'),
        actions: <Widget> [
           new IconButton(
             icon: new Icon(Icons.settings),
             tooltip: 'Settings',
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (_) => SettingsPage())
                 );
             }
           )
       ],
      ),
      body: _buildTodoList(),
      backgroundColor: Colors.blue[300],
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: new Icon(Icons.add)
      ),
    );
  }
  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.blue[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              title: Text('Add Stats'),
              actions: <Widget>[
                new RaisedButton(
                child: Text('Calculator'),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prefix0.MyApp())
                  );
                },
              )
              ]
            ),
             body: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                    //   The first text field is focused on as soon as the app starts.
                      // void _addTodoItem() {
                      //   databaseReference.child("1").set({
                          TextField(
                          autofocus: true,
                          onSubmitted: (val) {
                            _addTodoItem(val);
                            _pushAddTodoScreen2(); // Close the add todo screen
                          },
                          decoration: new InputDecoration(
                            hintText: 'Enter practice or game...' 
                          ),
                        ),
                      //   });
                      // }  
                    ],
                  ),
                ),
          );
        }
      )
    );
  }
    void _pushAddTodoScreen2() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.blue[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              title: Text('Add Stats'),
              actions: <Widget>[
                new RaisedButton(
                child: Text('Calculator'),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prefix0.MyApp())
                  );
                },
              )
              ]
            ),
             body: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                    //   The first text field is focused on as soon as the app starts.
                      // The second text field is focused on when a user taps the
                      // FloatingActionButton.
                      TextField(
                        autofocus: true,
                        onSubmitted: (val) {
                          _addTodoItem(val);
                          _pushAddTodoScreen3();// Close the add todo screen
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter the date...',
                        ),
                      ),
                    ],
                  ),
                ),
          );
        }
      )
    );
  }

   void _pushAddTodoScreen3() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.blue[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              title: Text('Add Stats'),
              actions: <Widget>[
                new RaisedButton(
                child: Text('Calculator'),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prefix0.MyApp())
                  );
                },
              )
              ]
            ),
             body: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                    //   The first text field is focused on as soon as the app starts.
                      // The second text field is focused on when a user taps the
                      // FloatingActionButton.
                      TextField(
                        autofocus: true,
                        onSubmitted: (val) {
                          _addTodoItem(val);
                          _pushAddTodoScreen4();// Close the add todo screen
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter how many points you scored...',
                        ),
                      ),
                    ],
                  ),
                ),
          );
        }
      )
    );
  }
    void _pushAddTodoScreen4() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.blue[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              title: Text('Add Stats'),
              actions: <Widget>[
                new RaisedButton(
                child: Text('Calculator'),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prefix0.MyApp())
                  );
                },
              )
              ]
            ),
             body: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                    //   The first text field is focused on as soon as the app starts.
                      // The second text field is focused on when a user taps the
                      // FloatingActionButton.
                      TextField(
                        autofocus: true,
                        onSubmitted: (val) {
                          _addTodoItem(val);
                          _pushAddTodoScreen5(); // Close the add todo screen
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter your shots...'
                        ),
                      ),
                      // The second text field is focused on when a user taps the
                      // FloatingActionButton.
                    ],
                  ),
                ),
          );
        }
      )
    );
  }
    void _pushAddTodoScreen5() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well as adding
      // a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            backgroundColor: Colors.blue[300],
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              title: Text('Add Stats'),
              actions: <Widget>[
                new RaisedButton(
                child: Text('Calculator'),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prefix0.MyApp())
                  );
                },
              )
              ]
            ),
             body: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        autofocus: true,
                        onSubmitted: (val) {
                          _addTodoItem(val);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context); // Close the add todo screen
                        },
                        decoration: new InputDecoration(
                          hintText: 'Enter your percentage...'
                        ),
                      ),
                    ],
                  ),
                ),
          );
        }
      )
    );
  }
}
