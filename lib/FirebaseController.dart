import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
DatabaseReference _groups = FirebaseDatabase.instance.reference().child('groups');
DatabaseReference _items = FirebaseDatabase.instance.reference().child('assoziationitems');

class Response {
  bool member;
}

test() {
  _dbRef.child("member2").set(true);
}

test2() {
  _dbRef.child("member").get().then((snapshot) {
    print(snapshot.value);
    return snapshot;
  });
}

void addItemToGroup(groupname, item) {
  _groups.child(groupname).child("member").child(item).set(true);
}

createOrUpdateItem(item) {
  _items.child(item).get().then((snapshot) {
    if (snapshot.value.lenght < 1) {
      // createItem(item);
    } else {
      updateItem(item);
    }
  });
}

createItem(groupname, item) {
  _items.child(item).set(
      <String, Object>{
        "name": item,
        "groups": <String, Object>{
          groupname: true
        }
      }
  );
}

updateItem(item) {

}
