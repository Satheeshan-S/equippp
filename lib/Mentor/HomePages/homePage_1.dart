import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/EventPage.dart';
import 'package:equippp/Mentor/HomePages/profilePage.dart';
import 'package:flutter/material.dart';

import 'detailsSession.dart';

String eventName = 'jhvbh';

class MHome extends StatelessWidget {
  const MHome({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomAppBarExample(name),
      ),
    );
  }
}

class BottomAppBarExample extends StatefulWidget {
  BottomAppBarExample(this.name);

  final name;

  @override
  _DemoBottomAppBar createState() => _DemoBottomAppBar(name);
}

class _DemoBottomAppBar extends State<BottomAppBarExample> {
  @override
  void initState() {
    super.initState();
    setState(() {
      eventName = name;
    });
  }

  _DemoBottomAppBar(this.name);

  final name;
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Container(child: SingleChildScrollView(child: HomeBody(eventName))),
    MEvent(),
    MEvent(),
    MProfile(
      name_p: eventName,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      _onItemTapped(0);
                    }),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MEvent()));
/*
                    _onItemTapped(1);
*/
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notification_add),
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody(
    this.name, {
    Key? key,
  }) : super(key: key);
  final name;

  @override
  State<HomeBody> createState() => _HomeBodyState(name);
}

String a = 'ff';

class _HomeBodyState extends State<HomeBody> {
  _HomeBodyState(this.name);

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  final name;

  String out() {
    final db = FirebaseFirestore.instance;
    db.collection("Mentor").where("email", isEqualTo: eventName).get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          a = docSnapshot.get('Url');
          print(a);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return a;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      eventName = name;
      out();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              out();
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(a),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Align(
                alignment: Alignment.topLeft, child: Text('Today Schedule')),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 330,
            child: hori_1(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Align(
                alignment: Alignment.topLeft, child: Text('Upcoming Events')),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: get()),
        ],
      ),
    );
  }
}

Widget get() {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  return StreamBuilder<QuerySnapshot>(
    stream: userRef.where('email', isNotEqualTo: eventName).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      List<User> users = snapshot.data!.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User(
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
                      width: 70.0,
                      height: 100.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                date(users[index].date.substring(3, 5)),
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
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 89,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ))),
                          onPressed: () {
                            null;
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

DateTime now = DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);

Widget hori_1() {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  return StreamBuilder<QuerySnapshot>(
    stream: userRef
        .where('email', isEqualTo: eventName)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      List<User> users = snapshot.data!.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User(
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
        );
      }).toList();

      return Column(mainAxisAlignment: MainAxisAlignment.start, children: <
          Widget>[
        SizedBox(
          height: 100,
          width: 330,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                        child: SizedBox(
                      height: 100,
                      width: 330,
                      child: GestureDetector(
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
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black),
                          child: SizedBox(
                            height: 100,
                            width: 300,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 13),
                                          child: Icon(
                                            Icons.circle_rounded,
                                            color: Colors.lightGreenAccent,
                                            size: 13,
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 13),
                                          child: Text(
                                            'Online',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40, top: 13),
                                          child: Padding(
                                            padding: const EdgeInsets.only(),
                                            child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                  (users[index]
                                                      .title
                                                      .trimLeft()),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                        ),
                                      ]),
                                  Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 40),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.punch_clock_rounded,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                users[index].time,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 130),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ))),
                                            onPressed: () {
                                              null;
                                            },
                                            child: const Text('Start Session'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ))
                  ]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
          ),
        ),
      ]);
    },
  );
}

String date(date_1) {
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

class User {
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

  User(
      {required this.name_d,
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
/*
return ListView.builder(
scrollDirection: Axis.vertical,
shrinkWrap: true,
itemCount: users.length,
itemBuilder: (BuildContext context, int index) {
return GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => (const MEvent()),
),
);
},
child: Container(
decoration: const BoxDecoration(color: Colors.white),
child: SizedBox(
height: 100,
width: 320,
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
child: Center(
child: Text(
'${users[index].date.substring(0, 2)}  '
' ${users[index].date.substring(3, 5)}',
style: const TextStyle(
fontSize: 15,
fontWeight: FontWeight.bold,
color: Colors.white),
)),
),
),
const SizedBox(
width: 40,
),
SizedBox(
width: 130,
child: Padding(
padding: const EdgeInsets.only(left: 0,right: 20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Padding(
padding: const EdgeInsets.only(bottom: 5),
child: FittedBox(
fit: BoxFit.fitWidth,
child: Text((users[index].title.trimLeft()),style: const TextStyle( fontSize: 15,fontWeight: FontWeight.bold),)),
),
Row(
mainAxisAlignment:MainAxisAlignment.start,
children: <Widget>[
const Icon(Icons.timelapse,size: 13,),
Text(users[index].time),
],
),
const SizedBox(
height: 5,
),
Row(
mainAxisAlignment:MainAxisAlignment.start,
children: <Widget>[
const Icon(Icons.date_range_outlined,size: 13,),
Text(users[index].date),
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
);
},
);
*/

/*
Widget hori() {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  return StreamBuilder<QuerySnapshot>(
      stream: userRef.where('name', isEqualTo: eventName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        List<User> users = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return User(
              title: data['title'],
              date: data['date'],
              time: data['time'],
              Des: data['des']);
        }).toList();
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (const MEvent()),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SizedBox(
                  height: 100,
                  width: 330,
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
                          child: Center(
                              child: Text(
                            '${users[index].date.substring(0, 2)} '
                            ' ${users[index].date.substring(3, 5)}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
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
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      });
}
*/

/*
return Scaffold(
body: Padding(
padding: const EdgeInsets.only(left: 10, right: 10),
child: SingleChildScrollView(child: HomeBody(name))),
bottomNavigationBar: BottomAppBar(
shape: const AutomaticNotchedShape(RoundedRectangleBorder(
borderRadius: BorderRadius.all(
Radius.circular(25),
),
)),
child: Padding(
padding: EdgeInsets.all(12),
child: Container(
decoration: BoxDecoration(
border: Border.all(
width: 2,
),
borderRadius: BorderRadius.circular(12),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[
IconButton(
icon: const Icon(Icons.home),
onPressed: () {},
),
IconButton(
icon: const Icon(Icons.calendar_today),
onPressed: () {
Navigator.push(context,
MaterialPageRoute(builder: (context) => const MEvent()));
},
),
IconButton(
icon: const Icon(Icons.notification_add),
onPressed: () {},
),
IconButton(
icon: const Icon(Icons.person),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => MProfile(
name_p: name,
)));
},
),
],
),
),
),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
);
*/
/*
SizedBox(
width: 70.0,
height: 100.0,
child: DecoratedBox(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
color: Colors.black),
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Center(
child: Text(
date(users[index]
.date
    .substring(3, 5)),
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
'${users[index].date.substring(0, 2)} '
'',
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
padding: const EdgeInsets.only(
left: 0, right: 20),
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: <Widget>[
Padding(
padding:
const EdgeInsets.only(bottom: 5),
child: FittedBox(
fit: BoxFit.fitWidth,
child: Text(
(users[index].title.trimLeft()),
style: const TextStyle(
fontSize: 15,
fontWeight:
FontWeight.bold),
)),
),
Row(
mainAxisAlignment:
MainAxisAlignment.start,
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
mainAxisAlignment:
MainAxisAlignment.start,
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
),*/
