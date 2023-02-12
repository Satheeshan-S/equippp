import 'package:equippp/spage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: fpage(),
      ),
    );
  }
}

class fpage extends StatelessWidget {
  const fpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 650,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("lib/images/fb.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: 60,
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SApp()));
              },
              child: const Text("Register"),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: TextButton(
              onPressed: () {
                null;
              },
              child: const Text("You have already register ? Sign in"),
            ),
          ),
        ),
      ],
    );
  }
}
