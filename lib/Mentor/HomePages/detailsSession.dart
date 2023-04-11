import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/homePage_1.dart';
import 'package:flutter/material.dart';

String a1 = 'nn';
String e='';
class SDetails extends StatelessWidget {
  const SDetails(
      {Key? key,
      required this.name,
      required this.title,
      required this.date,
      required this.time,
      required this.link,
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
  final String link;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              a1 = '';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MHome(name: eventName)));
            },
            icon: const Icon(Icons.arrow_circle_left),
          ),
          title: const Text('Details Page'),
        ),
        body: SDetailsState(
            name: name,
            link: link,
            title: title,
            date: date,
            time: time,
            Des: Des,
            meeting: meeting,
            content1: content1,
            content2: content2,
            content3: content3,
            content4: content4),
      ),
    );
  }
}

class SDetailsState extends StatefulWidget {
  const SDetailsState(
      {Key? key,
      required this.name,
      required this.title,
      required this.date,
      required this.time,
      required this.link,
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
  final String link;

  @override
  State<SDetailsState> createState() => _SDetailsStateState(
      name: name,
      link: link,
      title: title,
      date: date,
      time: time,
      Des: Des,
      meeting: meeting,
      content1: content1,
      content2: content2,
      content3: content3,
      content4: content4);
}

class _SDetailsStateState extends State<SDetailsState> {
  _SDetailsStateState(
      {required this.name,
      required this.title,
      required this.date,
      required this.time,
      required this.link,
      required this.Des,
      required this.meeting,
      required this.content1,
      required this.content2,
      required this.content3,
      required this.content4});

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
  final String link;

  String date_d(date_1) {
    if (date_1 == '01') {
      return 'Jan';
    } else if (date_1 == '02') {
      return 'Feb';
    } else if (date_1 == '03') {
      return 'Mar';
    } else if (date_1 == '04') {
      return 'Apr';
    } else if (date_1 == '05') {
      return 'May';
    } else if (date_1 == '06') {
      return 'Jun';
    } else if (date_1 == '07') {
      return 'Jul';
    } else if (date_1 == '08') {
      return 'Aug';
    } else if (date_1 == '09') {
      return 'Sep';
    } else if (date_1 == '10') {
      return 'Oct';
    } else if (date_1 == '11') {
      return 'Nov';
    } else {
      return 'Dec';
    }
  }

  Future<String> img(name) async {
    final db = FirebaseFirestore.instance;
    await db
        .collection("Mentor")
        .where("email", isEqualTo: name)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        setState(() {
          a1 = docSnapshot.get('Url');
        });
        print(a1);
      }
    });
    return a1;
  }

  Future<String> explain() async {
    final db = FirebaseFirestore.instance;
     await db
        .collection("Mentor")
        .where("email", isEqualTo: name)
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        setState(() {
          e = docSnapshot.get('explain');
        });
        print(e);
      }
    });
    return e;
  }

  @override
  void initState() {
    super.initState();
    explain();
    img(name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  img(name);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(a1),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20), child: Text(name)),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'TITLE OF THE SESSION :',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'CONTENT TO BE COVERED :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '1.$content1',
                style: const TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '2.$content2',
                style: const TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '3.$content3',
                style: const TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '4.$content4',
                style: const TextStyle(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ABOUT THE HUMAN LIBRARY :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 13),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 40,
                child: Text(e),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('${date_d(date.substring(3, 5))}'
                  ''
                  '${date.substring(0, 2)} '),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SizedBox(
              height: 100,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.0,
                    height: 100.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              date_d(date.substring(3, 5)),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            const SizedBox(
                              height: 6,
                            ),
                            Center(
                                child: Text(
                              '${date.substring(0, 2)} ' '',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  (title.trimLeft()),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Icon(
                                Icons.timelapse,
                                size: 13,
                              ),
                              Text(time),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Icon(
                                Icons.date_range_outlined,
                                size: 13,
                              ),
                              Text(date),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      child: const Text('Join now'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
