import 'package:basketball_calculator/home.dart' as prefix0;
import 'package:flutter/material.dart';


void main() => runApp(new SearchApp());

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Api Filter list Demo',
       debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
 // final formKey = new GlobalKey<FormState>();
 // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
    String _searchText = "";
    List names = new List();
    List filteredNames = new List();
    Icon _searchIcon = new Icon(Icons.search);
    Widget _appBarTitle = new Text( 'Search' );
  
    _ExamplePageState() {
      _filter.addListener(() {
        if (_filter.text.isEmpty) {
          setState(() {
            _searchText = "";
            filteredNames = names;
          });
        } else {
          setState(() {
            _searchText = _filter.text;
          });
        }
      });
    }
  
    @override
    void initState() {
      this._getNames();
      super.initState();
    }
  
    Widget build(BuildContext context) {
      return Scaffold( 
        backgroundColor: Colors.blue[300],
        appBar: _buildBar(context),
        // actions: <Widget>[
        //   new RaisedButton(
        //     child: Text('Home'),
        //     color: Colors.white,
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => TodoApp())
        //       );
        //     },
        //   )
        // ],
        body: Container(
          child: _buildList(),
        ),
        resizeToAvoidBottomPadding: false,
      );
    }
  
    Widget _buildBar(BuildContext context) {
      return new AppBar(
        backgroundColor: Colors.blue[300],
        actions: <Widget>[
          new RaisedButton(
              child: new Text('Home'),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => prefix0.TodoApp())
                );
              }
            ),
        ], 
        centerTitle: true,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      );
    }
  
    Widget _buildList() {
      if (!(_searchText.isNotEmpty)) {
        List tempList = new List();
        for (int i = 0; i < filteredNames.length; i++) {
          if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
            tempList.add(filteredNames[i]);
          }
        }
        filteredNames = tempList;
      }
      return ListView.builder(
        itemCount: names == null ? 0 : filteredNames.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(filteredNames[index]['name']),
            onTap: () => print(filteredNames[index]['name']),
          );
        },
      );
    }
  
    void _searchPressed() {
      setState(() {
        if (this._searchIcon.icon == Icons.search) {
          this._searchIcon = new Icon(Icons.close);
          this._appBarTitle = new TextField(
            controller: _filter,
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
            ),
          );
        } else {
          this._searchIcon = new Icon(Icons.search);
          this._appBarTitle = new Text( 'Search' );
          filteredNames = names;
          _filter.clear();
        }
      });
    }
  
    void _getNames() async {
      final response = await dio.get('https://swapi.co/api/people');
            List tempList = new List();
            for (int i = 0; i < response.data['results'].length; i++) {
              tempList.add(response.data['results'][i]);
            }
            setState(() {
              names = tempList;
              names.shuffle();
              filteredNames = names;
            });
          }
        
        
        }
        
        class Dio {
        get(String s) {}
}
