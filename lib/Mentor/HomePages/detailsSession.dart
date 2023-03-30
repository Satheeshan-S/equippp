import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/homePage_1.dart';
import 'package:flutter/material.dart';
String a1='nn';
class SDetails extends StatelessWidget {
  const SDetails(
      {Key? key,
      required this.name,
      required this.title,
      required this.date,
      required this.time,
      required this.Des,
      required this.meeting,
      required this.content1,
      required this.content2,
      required this.content3,
      required this.content4})
      : super(key: key);
  final String name;
  final String title;
  final String date;
  final String time;
  final String Des;
  final String meeting;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  String out_1() {
    final db = FirebaseFirestore.instance;
    db.collection("Mentor").where("name", isEqualTo: name).get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          a1= docSnapshot.get('Url');
          print( docSnapshot.get('age'));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return a1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MHome(name: eventName)));
            },
            icon: const Icon(Icons.arrow_circle_left),
          ),
          title: const Text('Details Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               GestureDetector(
                 onTap: (){
                   out_1();
                 },
                 child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(a1),
                  ),
              ),
               ),
              Text('Name : $name'),
              Text('Title : $title'),
              Text('Date : $date'),
              Text('Time : $time'),
              Text('Meeting Type : $meeting'),
              Text('Content1 : $content1'),
              Text('Content1 : $content2'),
              Text('Content1 : $content3'),
              Text('Content1 : $content4'),
            ]),
      ),
    );
  }
}
