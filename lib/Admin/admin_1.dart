import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AHome.dart';

class User {
  String name;
  String gender;
  int age;
  int phone;
  String status;
  String explain;
  String description;
  String skills;
  String Url;

  User({
    required this.name,
    required this.gender,
    required this.age,
    required this.phone,
    required this.status,
    required this.explain,
    required this.description,
    required this.skills,
    required this.Url,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'phone': phone,
      'status': status,
      'explain': explain,
      'description': description,
      'skills': skills,
      'Url': Url,
    };
  }
}

class admin_1 extends StatelessWidget {
  const admin_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mentor Page'),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ad()));
            },
            icon: const Icon(Icons.home),
          ),
        ),
        body: const SingleChildScrollView(
          child: MLadmin_1(),
        ),
      ),
    );
  }
}

class MLadmin_1 extends StatefulWidget {
  const MLadmin_1({Key? key}) : super(key: key);

  @override
  State<MLadmin_1> createState() => _MLadmin_1State();
}

class _MLadmin_1State extends State<MLadmin_1> {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Mentor');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: usersRef.where('verify', isEqualTo: false).snapshots(),
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
            name: data['name'],
            gender: data['gender'],
            age: data['age'],
            phone: data['phone'],
            status: data['status'],
            explain: data['explain'],
            description: data['description'],
            skills: data['skills'],
            Url: data['Url'],
          );
        }).toList();

        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          /* Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ad()));
              },
              icon: const Icon(Icons.backspace),
            ),
          ),*/
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(users[index].Url),
                  ),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].explain),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        final usersCollection =
                            FirebaseFirestore.instance.collection('Mentor');
                        final user1DocRef =
                            usersCollection.doc(users[index].name);
                        user1DocRef.update({'verify': true});
                        Future<void> _saveData() async {
                          final name = users[index].name;
                          final gender = users[index].gender;
                          final age = users[index].age;
                          final phone = users[index].phone;
                          final status = users[index].status;
                          final explain = users[index].explain;
                          final description = users[index].description;
                          final skills = users[index].skills;
                          final Url = users[index].Url;
                          final myData = User(
                            name: name,
                            age: age,
                            gender: gender,
                            phone: phone,
                            status: status,
                            explain: explain,
                            description: description,
                            skills: skills,
                            Url: Url,
                          );

                          await FirebaseFirestore.instance
                              .collection('loggedMentor')
                              .doc(name)
                              .set(myData.toJson());
                          await FirebaseFirestore.instance
                              .collection('Mentor')
                              .doc(name)
                              .set(myData.toJson());
                        }

                        _saveData();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        ]);
      },
    );
  }
}
