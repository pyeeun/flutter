import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello world"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child:
                  Text("create button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                //클릭시 데이터를 추가해준다.
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("read button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                String title = "";
                firestore
                    .collection("users")
                    .doc("id")
                    .get()
                    .then((DocumentSnapshot ds) {
                  //title = ds.get("id");
                  print(title);
                });
              },
            ),
            FlatButton(
              color: Colors.blue,
              child:
                  Text("update button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                //클릭시 데이터를 갱신해준다.
              },
            ),
            FlatButton(
              color: Colors.blue,
              child:
                  Text("delete button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                //클릭시 데이터를 삭제해 준다.
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return HISApp();
        }
        return Loading();
      },
    )
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H-IS', // FirebaseApp
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('H-IS')),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      return _buildList(context, snapshot.data.docs);
    },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final user = User.fromSnapshot(data);

  return Padding(
    key: ValueKey(user.id),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(user.name),
        onTap: () => print(user),
      ),
    ),
  );
}

class User {
  final String id;
  final String name;
  final DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : id = map['id'],
        name = map['name'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() {
    return 'User {id:$id, name:$name}';
  }
}
/*
class GetUser extends StatelessWidget {
  final String documentId;
  GetUser(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Name: ${data['name']}");
        }
        return Text("loading");
      },
    );
  }
}
*/
/*



Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      return _buildList(context, snapshot.data.docs);
    },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final user = User.fromSnapshot(data);

  return Padding(
    key: ValueKey(user.id),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(user.name),
        onTap: () => print(user),
      ),
    ),
  );
}

class User {
  final String userno;
  final String id;
  final String name;
  final String email;
  final DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : userno = map['userno'],
        id = map['id'],
        name = map['name'],
        email = map['email'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() {
    return 'User {id:$id, name:$name, email:$email}';
  }
}
*/
