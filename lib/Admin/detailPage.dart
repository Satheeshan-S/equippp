import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Admin/admin_1.dart';
import 'package:flutter/material.dart';

class detail extends StatelessWidget {
  const detail(
      {Key? key,
      required this.email,
      required this.name,
      required this.gender,
      required this.age,
      required this.phone,
      required this.status,
      required this.explain,
      required this.description,
      required this.Url})
      : super(key: key);
  final String name;
  final String email;
  final String gender;
  final int age;
  final int phone;
  final String status;
  final String explain;
  final String description;
  final String Url;

 /* String out_1() {
    final db = FirebaseFirestore.instance;
    db.collection("Mentor").where("email", isEqualTo: name).get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print(docSnapshot.get('Url'));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return 'jj';
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const admin_1()));
            },
            icon: const Icon(Icons.arrow_circle_left),
          ),
          title: const Text('Details Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(Url),
                ),
              ),
              Text('Name : $name'),
              Text('Name : $email'),
              Text('Gender : $gender'),
              Text('Age : $age'),
              Text('Phone Number : $phone'),
              Text('Status : $status'),
              Text('Explain : $explain'),
              Text('Description : $description'),
            ]),
      ),
    );
  }
}
