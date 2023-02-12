import 'package:flutter/material.dart';

void main() {
  runApp(const LApp());
}

class LApp extends StatelessWidget {
  const LApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: LPage(),
      ),
    );
  }
}

class LPage extends StatelessWidget {
  const LPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Sign in as Mentor'),
        const Text('Hello,welcome back to Trag'),
        SizedBox(
          height: 50,
          width: 170,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.phone,
                size: 24.0,
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.brown)))),
              onPressed: () {
                null;
              },
              label: const Text('Login with Mobile Number'),
            ),
          ),
        ),
      ],
    );
  }
}
