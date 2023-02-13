import 'package:flutter/material.dart';

void main() {
  runApp(const MoLoginApp());
}

class MoLoginApp extends StatelessWidget {
  const MoLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Image.asset("lib/images/images.png"),
        ),
        const Padding(padding: EdgeInsets.only(top: 60)),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16
            )
          ),
        ),
      ],
    );
  }
}
