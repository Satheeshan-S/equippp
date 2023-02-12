import 'package:equippp/mailc.dart';
import 'package:equippp/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LMApp());
}

class LMApp extends StatelessWidget {
  const LMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LMPage(),
      ),
    );
  }
}

class LMPage extends StatefulWidget {
  const LMPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LMPage> {
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
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Sign in as Mentor',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Hello,welcome back to Trag',
            style: TextStyle(fontSize: 10),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 40)),
        Center(
          child: SizedBox(
            height: 40,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
                onPressed: () {
                  null;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'lib/images/phone.jpeg',
                        height: 40,
                        width: 40,
                      ),
                      const Text(
                        'Continue with Mobile',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(13)),
        Center(
          child: SizedBox(
            height: 40,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ))),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MCPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'lib/images/google.png',
                        height: 40,
                        width: 40,
                      ),
                      const Text(
                        'Continue with Gmail',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(15)),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
            },
            icon: const Icon(
              Icons.arrow_right_outlined,
              size: 24.0,
            ),
            label: const Text('Login'),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8)),
        Center(
          child: TextButton(
            onPressed: () {
              null;
            },
            child: const Text('Dont have an account please register? Sign up'),
          ),
        ),
      ],
    );
  }
}
