import 'package:flutter/material.dart';
class LProfile extends StatelessWidget {
  const LProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LProfileState(),
      ),
    );
  }
}

class LProfileState extends StatefulWidget {
  const LProfileState({Key? key}) : super(key: key);

  @override
  State<LProfileState> createState() => _LProfileStateState();
}

class _LProfileStateState extends State<LProfileState> {
  @override
  Widget build(BuildContext context) {
    return Text('Profile page');
  }
}