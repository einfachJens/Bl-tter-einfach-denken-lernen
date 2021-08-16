import 'package:blaetter_denken_lernen/test.dart';
import 'package:flutter/material.dart';

import 'FirebaseController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blätter-einfach-denken-lernen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Blätter einfach denken lernen'),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => MyPage(title: 'page A'),
        '/b': (BuildContext context) => MyPage(title: 'page B'),
        '/c': (BuildContext context) => MyPage(title: 'page C'),
    },    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: Size(300, 30),
              ),

              onPressed: () {
                Navigator.pushNamed(context, '/a');
              },
              child: const Text('Add Group'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: Size(300, 30),
              ),
              onPressed: () => {
                Navigator.pushNamed(context, '/b')
              },
              child: const Text('List Group'),
            ),
          ],
        ),
      ),
    );
  }
}


