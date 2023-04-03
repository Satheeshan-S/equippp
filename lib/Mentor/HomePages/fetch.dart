import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(hhhhhh());
}

class hhhhhh extends StatelessWidget {
  const hhhhhh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('djchbdjh'),
        ),
        body: SizedBox(
          height: 67,
          child: MyWidget(),
        ),
      ),
    );
  }
}
String a='jjj';
List<dynamic> g=[];
String out() {
  final db = FirebaseFirestore.instance;
  db.collection("Mentor").where("name", isEqualTo: 'ddhd').get().then(
        (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print(docSnapshot.data());
        g = docSnapshot.get('age');
        print(g);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return a;
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          out();
        },
        child: Text('vhbfub'));
  }
}
