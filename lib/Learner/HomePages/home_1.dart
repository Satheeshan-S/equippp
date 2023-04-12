import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Learner/HomePages/lEvent.dart';
import 'package:equippp/Learner/HomePages/lProfile.dart';
import 'package:equippp/Provider/utils.dart';
import 'package:flutter/material.dart';

import '../../Mentor/HomePages/detailsSession.dart';

String lName = '';
String lphone = '';

class LHome extends StatelessWidget {
  const LHome({Key? key, required this.email, required this.phone})
      : super(key: key);
  final email;
  final phone;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomAppBarExample(email, phone),
      ),
    );
  }
}

class BottomAppBarExample extends StatefulWidget {
  BottomAppBarExample(this.email, this.phone);

  final email;
  final phone;

  @override
  _DemoBottomAppBar createState() => _DemoBottomAppBar(email, phone);
}

class _DemoBottomAppBar extends State<BottomAppBarExample> {
  @override
  void initState() {
    super.initState();
    setState(() {
      lName = email;
      lphone = phone;
    });
    print(lName);
    print(lphone);
  }

  _DemoBottomAppBar(this.email, this.phone);

  final email;
  final phone;
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    LHome_2(),
    LEvent(),
    LProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isPressed_1 = true;
  bool isPressed_2 = false;
  bool isPressed_3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 100,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.home,
                          color: isPressed_1 ? Colors.orange : Colors.black),
                      onPressed: () {
                        setState(() {
                          isPressed_1 = !isPressed_1;
                          isPressed_2 = false;
                          isPressed_3 = false;
                        });
                        _onItemTapped(0);
                      }),
                  IconButton(
                    icon: Icon(Icons.calendar_today,
                        color: isPressed_2 ? Colors.orange : Colors.black),
                    onPressed: () {
                      setState(() {
                        isPressed_1 = false;
                        isPressed_2 = !isPressed_2;
                        isPressed_3 = false;
                      });
                      _onItemTapped(1);
                    },
                  ),
                  IconButton(
                      icon: Icon(Icons.person,
                          color: isPressed_3 ? Colors.orange : Colors.black),
                      onPressed: () {
                        setState(() {
                          isPressed_1 = false;
                          isPressed_2 = false;
                          isPressed_3 = !isPressed_3;
                        });
                        _onItemTapped(2);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class LHome_2 extends StatelessWidget {
  const LHome_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LHome_2State(),
      ),
    );
  }
}

class LHome_2State extends StatefulWidget {
  const LHome_2State({Key? key}) : super(key: key);

  @override
  State<LHome_2State> createState() => _LHome_2StateState();
}

class _LHome_2StateState extends State<LHome_2State> {
  @override
  void initState() {
    super.initState();
    outl();
    outlp();
    print(ea);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 60,
          child: Row(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topStart,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Text(
                    'Logo',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_active),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black12),
        Padding(
            padding: const EdgeInsets.only(left: 11, right: 11), child: lget()),
      ],
    );
  }
}

Widget lget() {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  return StreamBuilder<QuerySnapshot>(
    stream: userRef.snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      List<Userl> users = snapshot.data!.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Userl(
          link: data['link'],
          name_d: data['email'],
          title: data['title'],
          date: data['date'],
          time: data['time'],
          Des: data['des'],
          meeting: data['meeting'],
          content1: data['content1'],
          content2: data['content2'],
          content3: data['content3'],
          content4: data['content4'],
          id: data['id'],
        );
      }).toList();

      return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (SDetails(
                    link: users[index].link,
                    name: users[index].name_d,
                    title: users[index].title,
                    date: users[index].date,
                    time: users[index].time,
                    Des: users[index].Des,
                    meeting: users[index].meeting,
                    content1: users[index].content1,
                    content2: users[index].content2,
                    content3: users[index].content3,
                    content4: users[index].content4,
                  )),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: SizedBox(
                height: 100,
                width: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 65.0,
                      height: 100.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrangeAccent),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                lHdate(users[index].date.substring(3, 5)),
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
                                '${users[index].date.substring(0, 2)} ' '',
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
                      width: 133,
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
                                    (users[index].title.trimLeft()),
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
                                Text(users[index].time),
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
                                Text(users[index].date),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: 89,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                          onPressed: () async {
                            List<int> a = [users[index].id];
                            if (lName == 'false') {
                              update_phone(a);
                            } else {
                              update(a);
                            }
                            showSnackBar(context,
                                'You have joined the ${users[index].title}');
                          },
                          child: const Text('Join now'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
      );
    },
  );
}

String lHdate(date_1) {
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

class Userl {
  final int id;
  final String name_d;
  final String Des;
  final String date;
  final String time;
  final String title;
  final String meeting;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  final String link;

  Userl(
      {required this.name_d,
      required this.id,
      required this.link,
      required this.meeting,
      required this.content1,
      required this.content2,
      required this.content3,
      required this.content4,
      required this.date,
      required this.time,
      required this.title,
      required this.Des});
}

bool update(List<int> newsession) {
  final firestoreInstance = FirebaseFirestore.instance;

  firestoreInstance
      .collection('Learner')
      .where('email', isEqualTo: lName)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      firestoreInstance
          .collection('Learner')
          .doc(doc.id)
          .update({'sessionid': FieldValue.arrayUnion(newsession)})
          .then((_) => print('Field Updated'))
          .catchError((error) => print('Error updating field: $error'));
    });
  });

  return true;
}

bool update_phone(List<int> newsp) {
  final firestoreInstance = FirebaseFirestore.instance;

  firestoreInstance
      .collection('Learner')
      .where('phone', isEqualTo: lphone)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      firestoreInstance
          .collection('Learner')
          .doc(doc.id)
          .update({'sessionid': FieldValue.arrayUnion(newsp)})
          .then((_) => print('Field Updated'))
          .catchError((error) => print('Error updating field: $error'));
    });
  });

  return true;
}

List<dynamic> ea = [];
List<dynamic> ep = [];

List<dynamic> outl() {
  final db = FirebaseFirestore.instance;
  db.collection("Learner").where("email", isEqualTo: lName).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        ea = docSnapshot.get('sessionid');
        print(ea);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return ea;
}
List<dynamic> outlp() {
  final db = FirebaseFirestore.instance;
  db.collection("Learner").where("phone", isEqualTo: lphone).get().then(
        (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        ep = docSnapshot.get('sessionid');
        print(ep);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return ep;
}
