import 'package:equippp/Admin/admin_1.dart';
import 'package:flutter/material.dart';

class detail extends StatelessWidget {
  const detail(
      {Key? key,
      required this.name,
      required this.gender,
      required this.age,
      required this.phone,
      required this.status,
      required this.explain,
      required this.description,
      required this.skills,
      required this.Url})
      : super(key: key);
  final String name;
  final String gender;
  final int age;
  final int phone;
  final String status;
  final String explain;
  final String description;
  final String skills;
  final String Url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const admin_1()));
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
              Text('Gender : $gender'),
              Text('Age : $age'),
              Text('Phone Number : $phone'),
              Text('Status : $status'),
              Text('Explain : $explain'),
              Text('Skills : $skills'),
              Text('Description : $description'),
            ]),
      ),
    );
  }
}
