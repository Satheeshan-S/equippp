
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Learner/MoLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class Uapp extends StatelessWidget {
  const Uapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: InterestField(),
          )),
    );
  }
}

final user = FirebaseAuth.instance.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Learner');
/*late final name ;

class MyData {
  String name;
  MyData(
      {required this.name,});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
Future<void> _saveData2() async {
  if(user?.phoneNumber != null){
    name=user?.phoneNumber;
  }
  else{
    name=user?.email;
  }
  final myData = MyData(
    name: name,
  );
  await userDoc.doc(name).set(myData.toJson());
}*/


final courseController = GroupButtonController();


class InterestField extends StatefulWidget {
  const InterestField({Key? key}) : super(key: key);

  @override
  State<InterestField> createState() => _InterestFieldState();
}

class _InterestFieldState extends State<InterestField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoLoginApp()));
            },
            child: Image.asset("lib/images/images.png"),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 42),
          child: Text(
            'What is Your Interest ?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 42, top: 5),
          child: Text(
            'Select yours areas of courses you would like to learn',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: GroupButton(
            isRadio: false,
            controller: courseController,
            options: GroupButtonOptions(
                spacing: 5,
                buttonHeight: 50,
                buttonWidth: 100,
                borderRadius: BorderRadius.circular(4),
                unselectedColor: Colors.grey,
                selectedColor: Colors.orangeAccent,
                selectedTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
                mainGroupAlignment: MainGroupAlignment.center,
                crossGroupAlignment: CrossGroupAlignment.center,
                groupingType: GroupingType.wrap,
                direction: Axis.horizontal),
            buttons: const [
              'Sports',
              'Trending',
              'Stock Market',
              'Business',
              'Education',
              'Technology',
              'Lifestyle',
              'Profession'
            ],
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Center(
          child: SizedBox(
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {
                main();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const statusApp()));
              },
              icon: const Icon(
                Icons.arrow_right,
                size: 24.0,
              ),
              label: const Text('continue'),
            ),
          ),
        ),
      ],
    );
  }
}

class statusApp extends StatelessWidget {
  const statusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: status(),
      ),
    );
  }
}


class status extends StatefulWidget {
  const status({Key? key}) : super(key: key);

  @override
  State<status> createState() => _statusState();
}

List<String> _groupNames = ['Working', 'Student', 'Unemployed'];

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Uapp()));
              },
              child: Image.asset("lib/images/images.png")),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Text(
            'Select Status',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 10),
          child: Text(
            'Select one of the option to continue',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Center(
          child: GroupButton(
            buttons: _groupNames,
            isRadio: false,
            maxSelected: 1,
            options: GroupButtonOptions(
              spacing: 8,
              selectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
              buttonHeight: 50,
              buttonWidth: 180,
              borderRadius: BorderRadius.circular(18),
              unselectedColor: Colors.grey,
              selectedColor: Colors.orangeAccent,
              mainGroupAlignment: MainGroupAlignment.center,
              crossGroupAlignment: CrossGroupAlignment.center,
              groupingType: GroupingType.column,
              direction: Axis.horizontal,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton.icon(
              onPressed: () {
/*
                _saveData2();
*/
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              icon: const Icon(Icons.arrow_right_outlined),
              label: const Text('continue')),
        )
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'User Authenticated',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}



