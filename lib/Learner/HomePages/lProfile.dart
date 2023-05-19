import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../mailc.dart';
import 'home_1.dart';

void getpr(){
  if(lName=='false'){
    fetchlp();
  }
  else{
    fetchl();
  }
}
String email = '';
String phone = '';
String name = '';
List<dynamic> interest = [];
String Status = '';
void fetchl() {
  final db = FirebaseFirestore.instance;
  db.collection("Learner").where("email", isEqualTo: lName).get().then(
        (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        email = docSnapshot.get('email');
        name = docSnapshot.get('name');
        Status = docSnapshot.get('status');
        interest = docSnapshot.get('interest');
        phone = docSnapshot.get('phone');
        print(email);
        print(name);
        print(Status);
        print(phone);
        print(interest);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

void fetchlp() {
  final db = FirebaseFirestore.instance;
  db.collection("Learner").where("phone", isEqualTo: lphone).get().then(
        (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        email = docSnapshot.get('email');
        name = docSnapshot.get('name');
        Status = docSnapshot.get('status');
        interest = docSnapshot.get('interest');
        phone = docSnapshot.get('phone');
        print(email);
        print(name);
        print(Status);
        print(phone);
        print(interest);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

class LProfile extends StatelessWidget {
  const LProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  void initState() {
    super.initState();
   getpr();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        getpr();
        return true; // Return true to allow the page to be popped
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.backspace),
              ),
            ),
            const SizedBox(
              width: 250,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.data_saver_on),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ClipOval(
            child: SizedBox.fromSize(
          size: const Size.fromRadius(50),
          child: Image.network(''),
        )),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8), child: Text(name)),
        Text(email),
        const SizedBox(
          height: 20,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.all(7),
              child: Text('Interest',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
           Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: interest.map((tag) {
                      return InputChip(
                        label: Text(tag),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.all(7),
                child: Text('Contact',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                decoration: const BoxDecoration(), //
                child: Text(phone),
              ),
            ),
          )
      ]),
    );
  }
}
