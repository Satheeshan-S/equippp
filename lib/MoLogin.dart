import 'package:flutter/material.dart';

void main() {
  runApp(const MoLoginApp());
}

class MoLoginApp extends StatelessWidget {
  const MoLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MoLoginpage(),
      ),
    );
  }
}

class MoLoginpage extends StatefulWidget {
  const MoLoginpage({super.key});

  @override
  _MLoginState createState() => _MLoginState();
}

class _MLoginState extends State<MoLoginpage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image.asset("lib/images/images.png"),
          ),
          const Padding(padding: EdgeInsets.only(top: 46)),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Login Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Hello,welcome back to Trag',
              style: TextStyle(fontSize: 10),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Phone Number',
              style: TextStyle(fontSize: 13),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Center(
            child: SizedBox(
              height: 33,
              width: 310,
              child: TextFormField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              )),
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right_outlined,
                size: 24.0,
              ),
              label: const Text('Request OTP'),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Center(
            child: TextButton(
              onPressed: () {
                null;
              },
              child:
                  const Text('Dont have an account please register? Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
