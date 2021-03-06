import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  DateTime _d = DateTime.now();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Click the FAB'),
      ),
      body: Center(
        child: Container(
          child: Text('$_counter clicks'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[200],
        child: Icon(
          Icons.favorite,
          color: _counter % 2 == 0 ? Colors.white : Colors.red,
        ),
        onPressed: () {
          _counter++;
          _scaffoldKey.currentState
            ..hideCurrentSnackBar()
            ..showSnackBar(_counter % 2 == 0
                ? SnackBar(
                    content: Text("Scaffold sin accion"),
                  )
                : SnackBar(
                    content: Text("Mostrar Fecha"),
                    action: SnackBarAction(
                      label: "Fecha",
                      onPressed: () {
                        _d = DateTime.now();
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("Dialogo"),
                                content: Text("$_d"),
                              );
                            });
                      },
                    ),
                  ));

          setState(() {});
        },
      ),
    );
  }
}
