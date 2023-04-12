import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Learner/SignupPage.dart';
import 'package:equippp/Login_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Uapp extends StatelessWidget {
  const Uapp({super.key, required this.phone, required this.email});

  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: InterestField(
              phonenum: phone,
              email: email,
            ),
          )),
    );
  }
}

final TextEditingController interestTagController = TextEditingController();
final TextEditingController statusController = TextEditingController();

List<String> _buttonTexts = ['Working', 'Student', 'Unemployed'];
List<bool> _isSelected = [false, false, false];
String _selectedText = '';
List<String> _tags = [];
String phonei = '';
String? namel = '';
String? lemail = '';

final FirebaseFirestore _db = FirebaseFirestore.instance;

Future<void> _saveDataEmail(namel, lemail) async {
  final myData = MyDataL(
    name: namel,
    email: lemail,
    interest: _tags,
    status: _selectedText,
    phone: '',
    sessionid: [],
  );
  await _db.collection('Learner').doc().set(myData.toJson());
}

Future<void> _saveDataPhone(phoneie) async {
  final myData = MyDataL(
    name: namel,
    email: lemail,
    interest: _tags,
    status: _selectedText,
    phone: phonei,
    sessionid: [],
  );
  await _db.collection('Learner').doc().set(myData.toJson());
}

class MyDataL {
  String? name;
  String? email;
  String phone;
  List interest;
  String status;
  List<int> sessionid;

  MyDataL(
      {required this.email,
      required this.sessionid,
      required this.phone,
      required this.name,
      required this.status,
      required this.interest});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'interest': interest,
      'status': status,
      'phone': phone,
      'sessionid': sessionid,
    };
  }
}

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

class InterestField extends StatefulWidget {
  final phonenum;
  final String email;

  const InterestField({Key? key, this.phonenum, required this.email})
      : super(key: key);

  @override
  State<InterestField> createState() => _InterestFieldState(phonenum, email);
}

class _InterestFieldState extends State<InterestField> {
  final phone;
  final String email;

  _InterestFieldState(this.phone, this.email);

  @override
  void initState() {
    setState(() {
      phonei = phone;
    });
    print(phone);
    super.initState();
    if (email == 'true') {
      namel = FirebaseAuth.instance.currentUser?.displayName!;
      lemail = FirebaseAuth.instance.currentUser?.email!;
      FirebaseAuth.instance.currentUser?.email!;
      print(FirebaseAuth.instance.currentUser?.email);
    } else {}
  }

  void _addTag(String tag) {
    if (!_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
      interestTagController.clear();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

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
                  MaterialPageRoute(builder: (context) => const LMPage()));
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
        Padding(
          padding: const EdgeInsets.only(left: 42, bottom: 5, top: 5),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _tags.map((tag) {
              return InputChip(
                label: Text(tag),
                onDeleted: () {
                  _removeTag(tag);
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.only(left: 42, bottom: 5, top: 5),
            child: TextField(
              controller: interestTagController,
              onSubmitted: _addTag,
              decoration: const InputDecoration(
                hintText: 'Enter the interested fields',
              ),
            ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => statusApp(
                              phone: phone,
                              email: '',
                            )));
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
  final String phone;
  final String email;

  const statusApp({Key? key, required this.phone, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: status(
          phone: '',
          email: '',
        ),
      ),
    );
  }
}

class status extends StatefulWidget {
  final String phone;
  final String email;

  const status({Key? key, required this.phone, required this.email})
      : super(key: key);

  @override
  State<status> createState() => _statusState(phone, email);
}

class _statusState extends State<status> {
  final phone;
  final email;

  _statusState(this.phone, this.email);

  @override
  void initState() {
    super.initState();
    print(phonei);
    print(FirebaseAuth.instance.currentUser?.displayName);
    print(FirebaseAuth.instance.currentUser?.email);
  }

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
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Uapp(
                              phone: '',
                              email: 'false',
                            )));
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
        const Center(
            child: CircleAvatar(
          radius: 130,
          backgroundImage: AssetImage('lib/images/status_1.png'),
        )),
        const SizedBox(
          height: 13,
        ),
        Center(
          child: ToggleButtons(
            isSelected: _isSelected,
            renderBorder: false,
            selectedColor: Colors.orange,
            fillColor: Colors.orange.shade200,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }
                _selectedText = _buttonTexts[index];
              });
            },
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(_buttonTexts[0]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(_buttonTexts[1]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(_buttonTexts[2]),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton.icon(
                onPressed: () async {
                  if (phonei != '') {
                    _saveDataPhone(phonei);
                  } else {
                    _saveDataEmail(
                        FirebaseAuth.instance.currentUser?.displayName,
                        FirebaseAuth.instance.currentUser?.email);
                  }
                  showModalBottomSheet<void>(
                    backgroundColor: Colors.deepPurpleAccent,
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const <Widget>[
                                        Text(
                                          'Thank You',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.verified_rounded,
                                          size: 150,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                height: 200,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 12),
                                        child:te(email, phone),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    Colors.deepPurpleAccent)),
                                        // Here Im having the error                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SLogin()));
                                        },
                                        child: const Text(
                                          'Go to login page',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Continue')),
          ),
        )
      ],
    );
  }
}
Widget te(email,phone){
  if(email=='true'){
    return Text('You have been registered as ${
    FirebaseAuth.instance.currentUser?.displayName}');
  }
  else{
    return Text('You have been registered with $phone');
  }
}