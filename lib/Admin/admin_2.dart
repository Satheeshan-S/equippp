import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AHome.dart';

class User {
  final String title;
  final String des;

  User({required this.title, required this.des});
}

class admin_2 extends StatelessWidget {
  const admin_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Session Details'),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ad()));
            },
            icon: const Icon(Icons.home),
          ),
        ),
        body: const SingleChildScrollView(
          child: MLadmin_2(),
        ),
      ),
    );
  }
}

class MLadmin_2 extends StatefulWidget {
  const MLadmin_2({Key? key}) : super(key: key);

  @override
  State<MLadmin_2> createState() => _MLadmin_2State();
}

class _MLadmin_2State extends State<MLadmin_2> {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Sessions');

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
          return User(title: data['title'], des: data['des']);
        }).toList();

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(users[index].title),
              subtitle: Text(users[index].des),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      final usersCollection =
                          FirebaseFirestore.instance.collection('Session');
                      final user1DocRef =
                          usersCollection.doc(users[index].title);
                      user1DocRef.update({'verify': true});
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
        );
      },
    );
  }
}
