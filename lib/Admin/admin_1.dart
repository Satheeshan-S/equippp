import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String title;
  final String imageUrl;
  User({required this.name, required this.title, required this.imageUrl});
}

class admin_1 extends StatelessWidget {
  const admin_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
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
        stream: usersRef.where('verify',isEqualTo: false).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<User> users = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return User(
              name: data['name'],
              title: data['explain'],
              imageUrl: data['Url']
            );
          }).toList();

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(users[index].imageUrl),
                  ),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        final usersCollection = FirebaseFirestore.instance.collection('Mentor');
                        final user1DocRef = usersCollection.doc(users[index].name);
                        user1DocRef.update({'verify': true});
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                      },
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
