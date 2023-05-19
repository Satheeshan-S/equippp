import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Admin/admin_1.dart';
import 'package:equippp/Provider/utils.dart';
import 'package:flutter/material.dart';

TextEditingController PasswordController = TextEditingController();
String email_1 = '';

class DetailMentor extends StatefulWidget {
  const DetailMentor(
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

  @override
  State<DetailMentor> createState() => _DetailMentorState(
        email: email,
        name: name,
        gender: gender,
        age: age,
        phone: phone,
        status: status,
        explain: explain,
        description: description,
        Url: Url,
      );
}

class _DetailMentorState extends State<DetailMentor> {
  _DetailMentorState(
      {required this.email,
      required this.name,
      required this.gender,
      required this.age,
      required this.phone,
      required this.status,
      required this.explain,
      required this.description,
      required this.Url});

  final String name;
  String email;
  final String gender;
  final int age;
  final int phone;
  final String status;
  final String explain;
  final String description;
  final String Url;

  @override
  void initState() {
    super.initState();
    setState(() {
      email_1 = email;
    });
  }

  Future<void> _saveData_d() async {
    final email = email_1;
    final password = PasswordController.text;
    final myData = User_d(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('Login_Mentor')
        .doc()
        .set(myData.toJson());
  }

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
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(Url),
            ),
          ),
          Text('Name : $name'),
          Text('Email : $email'),
          Text('Gender : $gender'),
          Text('Age : $age'),
          Text('Phone Number : $phone'),
          Text('Status : $status'),
          Text('Explain : $explain'),
          Text('Description : $description'),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 12),
            child: SizedBox(
              height: 60,
              width: 320,
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    PasswordController.text = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  hintText: 'Password?',
                  labelText: 'Password *',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 200,
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      if (PasswordController.text == '') {
                        showSnackBar(context, 'Enter a password for mentor');
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Entered a Password "),
                        ));
                        final usersCollection =
                            FirebaseFirestore.instance.collection('Mentor');
                        final user1DocRef =
                            usersCollection.where("name", isEqualTo: name);
                        user1DocRef.get().then(
                          (querySnapshot) {
                            print("Successfully completed");
                            for (var docSnapshot in querySnapshot.docs) {
                              docSnapshot.reference.update({'verify': true});
                            }
                          },
                        );
                        _saveData_d();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const admin_1()));
                      }
                    },
                    child: const Text('Register as a Mentor'),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

class User_d {
  String email;
  String password;

  User_d({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
