import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/EventPage.dart';
import 'package:equippp/Mentor/HomePages/profilePage.dart';
import 'package:flutter/material.dart';

String? eventName = 'jhvbh';

class MHome extends StatelessWidget {
  const MHome({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomAppBar(
          child: _DemoBottomAppBar(name),
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar(this.name);

  final name;

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MProfile()));
              },
            ),
          ],
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

class _HomeBodyState extends State<HomeBody> {
  _HomeBodyState(this.name);

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  final name;

  @override
  void initState() {
    super.initState();
    setState(() {
      eventName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userRef.snapshots(),
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
          physics: BouncingScrollPhysics(),
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
      },
    );
  }
}

class User {
  final String Des;
  final String date;
  final String time;
  final String title;

  User(
      {required this.date,
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
