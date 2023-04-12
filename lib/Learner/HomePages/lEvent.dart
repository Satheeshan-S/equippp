import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Mentor/HomePages/detailsSession.dart';
import 'home_1.dart';

class LEvent extends StatelessWidget {
  const LEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  void initState() {
    super.initState();
    getW();
    print(ea);
    print(ep);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:<Widget> [
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: Text(
            'Event you have Joined ',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 11, right: 11), child: lget_2()),
      ],
    );
  }
}
List<dynamic> fin=[];
void getW(){
  if(lName=='false'){
    fin=ep;
  }else{
    fin=ea;
  }
}
Widget lget_2() {
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('Sessions');
  return StreamBuilder<QuerySnapshot>(
    stream: userRef.where('id',whereIn: fin).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      List<Userl_2> users = snapshot.data!.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Userl_2(
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
                                lHdate_2(users[index].date.substring(3, 5)),
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
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: 89,
                        child: Text('Joined',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black),)
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

String lHdate_2(date_1) {
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

class Userl_2 {
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

  Userl_2(
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
