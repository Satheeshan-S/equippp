import 'package:flutter/material.dart';

class Uapp extends StatelessWidget {
  const Uapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: InterestField(),
          )),
    );
  }
}

class InterestField extends StatefulWidget {
  const InterestField({Key? key}) : super(key: key);

  @override
  State<InterestField> createState() => _InterestFieldState();
}

class _InterestFieldState extends State<InterestField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

      ],
    );
  }
}
