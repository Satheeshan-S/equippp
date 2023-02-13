import 'dart:async';
import 'package:equippp/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LMApp());
}

class LMapp extends StatelessWidget {
  const LMapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        backgroundColor: Colors.white,
        body:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Image.asset("lib/images/images.png"),
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
             Center( child:Text('${FirebaseAuth.instance.currentUser!.displayName}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ],
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LMApp())));
  }
}
