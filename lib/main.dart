import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(" "),
        ),
        body: const Center(
          child: fpage(),
        ),
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
        const SizedBox(
          height: 50,
        ),
        const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'You are a',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 60,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                side: const BorderSide(width: 3, color: Colors.brown),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(30)),
            onPressed: () {
              Null;
            },
            child: const Text("Learner"),
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(30),
            child: Text('Or',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ))),
        SizedBox(
          height: 60,
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                side: const BorderSide(width: 3, color: Colors.brown),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(30)),
            onPressed: () {
              Null;
            },
            child: const Text("Mentor"),
          ),
        ),
      ],
    );
  }
}

class Llogin extends StatefulWidget {
  const Llogin({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Llogin> {
  TextEditingController userInput = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: userInput,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
          onChanged: (value) {
            setState(() {
              userInput.text = value.toString();
            });
          },
        ),
        TextFormField(
          controller: userInput,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
          onChanged: (value) {
            setState(() {
              userInput.text = value.toString();
            });
          },
        ),
        TextFormField(
          controller: userInput,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
          onChanged: (value) {
            setState(() {
              userInput.text = value.toString();
            });
          },
        ),
      ],
    );
  }
}
