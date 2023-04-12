import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Learner/HomePages/lLogin.dart';
import 'package:equippp/Learner/UserInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LMapp());
}

class LMapp extends StatelessWidget {
  const LMapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MCPage(),
      ),
    );
  }
}

class MCPage extends StatefulWidget {
  const MCPage({super.key});

  @override
  _MCState createState() => _MCState();
}

class _MCState extends State<MCPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Image.asset("lib/images/images.png"),
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
              Center(
                  child: Text(
                ' You are signed in as ${FirebaseAuth.instance.currentUser!.displayName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    print(FirebaseAuth.instance.currentUser!.email);
                    final snapshot = await FirebaseFirestore.instance
                        .collection('Learner')
                        .where('email',
                            isEqualTo: FirebaseAuth.instance.currentUser!.email)
                        .get();
                    if (snapshot.docs.isNotEmpty) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const lLogin()));
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Uapp(phone: '', email: 'true')));
                    }
                  },
                  child: const Text('Move to Signup page'),
                ),
              )
            ],
          ),
        ));
  }
}

Future<String> checkUserExists() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  if (user != null) {
    return 'false';
  } else {
    return 'true';
  }
}
