import 'package:equippp/Mentor/HomePages/EventPage.dart';
import 'package:flutter/material.dart';

class MHome extends StatelessWidget {
  final name;

  const MHome({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MHomeState(
          name: name,
        ),
      ),
    );
  }
}

class MHomeState extends StatefulWidget {
  final name;

  const MHomeState({Key? key, this.name}) : super(key: key);

  @override
  State<MHomeState> createState() => _MHomeStateState();
}

class _MHomeStateState extends State<MHomeState> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Event()));
            },
            child: const Text('skm df')));
  }
}
