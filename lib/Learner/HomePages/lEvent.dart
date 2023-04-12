import 'package:flutter/material.dart';
class LEvent extends StatelessWidget {
  const LEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LEventState(),
      ),
    );
  }
}

class LEventState extends StatefulWidget {
  const LEventState({Key? key}) : super(key: key);

  @override
  State<LEventState> createState() => _LEventStateState();
}

class _LEventStateState extends State<LEventState> {
  @override
  Widget build(BuildContext context) {
    return Text('event page');
  }
}