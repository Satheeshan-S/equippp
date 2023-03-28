import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const hhhhhh());
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
        body: const SizedBox(
          height: 67,
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Mentor')
          .doc('Vignesh')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        Object? objectValue = snapshot.data?.data();
        if (objectValue != null) {
          Map<String, dynamic> mapValue =
              Map<String, dynamic>.from(objectValue as Map);
          final fieldValue = mapValue['name'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Text('fiel$fieldValue'),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 40,
              ),
              Text('tbb'),
            ],
          );
        }
      },
    );
  }
}