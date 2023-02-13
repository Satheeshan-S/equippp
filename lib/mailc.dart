import 'dart:async';
import 'package:equippp/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LMApp());
}
class LMapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
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
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LMApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white.withOpacity(0.5),
            child: Image.asset("lib/images/images.png"),
          ),
          const Padding(padding: EdgeInsets.only(top: 60)),
          Text('${FirebaseAuth.instance.currentUser!.displayName}'),

        ]);
  }
}
