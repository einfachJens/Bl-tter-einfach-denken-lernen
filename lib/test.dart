import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FirebaseController.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPage createState() => _MyPage();
}

class Association {
  String name = '';
  String group = '';
}

class _MyPage extends State<MyPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Association test1 = Association();
  String groupname = 'Baum';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              mainMenu()
            ],
        ),
      ),
    );
  }

  Widget mainMenu() {
    return Form(
      key: _formkey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tragen sie den Namen der Gruppe ein',
                      labelText: 'Gruppe'
                  ),
                  onSaved: (value) => test1.group = value
              ),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tragen sie den Namen des Items ein',
                      labelText: 'Name'
                  ),
                  onSaved: (value) => test1.name = value
              ),
              Center(
                  child: ElevatedButton(
                    child: Text('Senden'),
                    onPressed: _handleSubmitButton,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitButton() {
    final form = _formkey.currentState;
    form.save();

    addItemToGroup(test1.group, test1.name);
    createItem(test1.group, test1.name);
  }
}