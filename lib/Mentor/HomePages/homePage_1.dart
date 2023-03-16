import 'package:flutter/material.dart';

class MHome extends StatelessWidget {
  const MHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:MHome_State(),
      ),
    );
  }
}
class MHome_State extends StatefulWidget {
  const MHome_State({Key? key}) : super(key: key);

  @override
  State<MHome_State> createState() => _MHome_StateState();
}

class _MHome_StateState extends State<MHome_State> {
  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}
