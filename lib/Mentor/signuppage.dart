import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equippp/spage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equippp/main.dart';
import 'dart:io';

String name_sm='';
List<String> list = <String>['Male', 'Female', 'Others'];
String dropdownValue = list.first;
String dropdownValue_2 = 'select';
final FirebaseFirestore _db = FirebaseFirestore.instance;

late final downloadUrl;
final ImagePicker _picker = ImagePicker();
File _image = File('');
bool _isShow = true;
int val = 0;

String? get name => null;

Future<void> _saveData() async {
  final name = nameController.text;
  final gender = dropdownValue;
  final age = int.tryParse(ageController.text) ?? 0;
  final phone = int.tryParse(mPhone.text) ?? 0;
  final status = statusController.text;
  final explain = explainController.text;
  final description = desController.text;
  final skills = _tags;
  final Url = downloadUrl;
  final email=emailController.text;
  const verify = false;
  final myData = MyData(
    name: name,
    age: age,
    gender: gender,
    phone: phone,
    status: status,
    explain: explain,
    description: description,
    skills: skills,
    Url: Url,
    verify: verify,
    email: email,
  );
  await _db.collection('Mentor').doc().set(myData.toJson());
}

final TextEditingController skilltagcontroller = TextEditingController();
List<String> _tags = [];

class MSignup extends StatelessWidget {
  const MSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> onBackPressed(BuildContext context) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SApp(),
        ),
      );
      return false;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () => onBackPressed(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: const Msignupstate(),
          ),
        ),
      ),
    );

  }
}

class Msignupstate extends StatefulWidget {
  const Msignupstate({Key? key}) : super(key: key);

  @override
  State<Msignupstate> createState() => _MsignupstateState();
}
final bool isValid = EmailValidator.validate(emailController as String);

TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController statusController = TextEditingController();
TextEditingController explainController = TextEditingController();
TextEditingController mPhone = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController desController = TextEditingController();

class _MsignupstateState extends State<Msignupstate> {
  String _textFieldValue = '';
  Country selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'IN',
    e164Key: '',
  );



  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    statusController = TextEditingController();
    explainController = TextEditingController();
    mPhone = TextEditingController();
    ageController = TextEditingController();
    desController = TextEditingController();
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
                    builder: (context) => const SApp(),
                  ));
            },
            child: Image.asset("lib/images/images.png"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            'Sign in as Mentor',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            'Hello, welcome back to Trag',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  name_sm=value;
                  nameController.text = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                hintText: 'Name?',
                labelText: name_sm,
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
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  emailController.text = value;
                  _textFieldValue = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                hintText: '',
                labelText: ' Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                suffixIcon: EmailValidator.validate(emailController.text)
                    ? Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                )
                    : null,
              ),
            ),
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: SizedBox(
                  height: 60,
                  width: 150,
                  child: DropdownButtonFormField(
                    icon: const Icon(Icons.arrow_downward_sharp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      labelText: 'Gender',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.black), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.black), //<-- SEE HERE
                      ),
                    ),
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female', 'Others']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 12),
              child: SizedBox(
                  height: 60,
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        ageController.text = value as String;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Age',
                      labelText: 'Age',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  mPhone.text = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Phone Number',
                labelText: 'Phone Number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                prefixIcon: Container(
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 5.0, left: 4.0),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 550,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                suffixIcon: mPhone.text.length > 9
                    ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  statusController.text = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Current status',
                labelText: 'Current Status',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 20),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  explainController.text = value as String;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Achievements',
                labelText: 'Briefly explain about yourself',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: SizedBox(
            height: 40,
            width: 240,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        val = 1;
                        _image = File(pickedFile.path);
                      });
                    }
                    setState(() {
                      _isShow = false;
                    });
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('pick an image'),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 220),
          child: SizedBox(
            height: 40,
            width: 120,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {
                    if (val == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the image"),
                      ));
                    } else if (nameController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the name field"),
                      ));
                    } else if (statusController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the status field"),
                      ));
                    } else if (explainController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the explain field"),
                      ));
                    } else if (ageController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the age field"),
                      ));
                    } else if (mPhone.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Enter  the phone  number"),
                      ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MSignup_2()));
                    }
                  },
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Next'),
                )),
          ),
        ),
      ],
    );
  }
}

Future<String?> _uploadImageToStorage() async {
  try {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('Mentor/${nameController.text}/${nameController.text}.jpg');
    final uploadTask = storageRef.putFile(_image);
    final snapshot = await uploadTask
        .whenComplete(() => print('Image uploaded to Firebase.'));
    downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print('Error uploading image to Firebase: $e');
    return null;
  }
}

class MSignup_2 extends StatelessWidget {
  const MSignup_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Msignupstate_2()),
      ),
    );
  }
}

class Msignupstate_2 extends StatefulWidget {
  const Msignupstate_2({Key? key}) : super(key: key);

  @override
  State<Msignupstate_2> createState() => _MsignupstateState_2();
}

class _MsignupstateState_2 extends State<Msignupstate_2> {
  void _addTag(String tag) {
    if (!_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
      skilltagcontroller.clear();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildImagePicker_2() {
    _uploadImageToStorage();
    return Column(
      children: [
        const SizedBox(height: 16.0),
        if (_image.path.isNotEmpty)
          ClipOval(
              child: SizedBox.fromSize(
            size: const Size.fromRadius(50),
            child: Image.file(_image),
          ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onBackPressed() async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Msignupstate()),
      );
      return false;
    }
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MSignup(),
                    ));
              },
              child: Image.asset("lib/images/images.png"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Sign in as Mentor',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Hello, welcome back to Trag',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildImagePicker_2(),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18, bottom: 5),
            child: Text('Why do you want to conduct this session.'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  desController.text = value;
                });
              },
              maxLines: 5,
              minLines: 3,
              decoration: InputDecoration(
                labelText: 'Add some Description',
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18, bottom: 5),
            child: Text('Add Skills'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 5, top: 5),
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
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 5, top: 5),
            child: TextField(
              controller: skilltagcontroller,
              onSubmitted: _addTag,
              decoration: const InputDecoration(
                hintText: 'Enter a tag',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 220),
            child: SizedBox(
              height: 40,
              width: 120,
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      setState(() {
                        name_sm='';
                      });
                      _uploadImageToStorage();
                      if (validate(
                        nameController.text,
                        ageController.text,
                        mPhone.text,
                        statusController.text,
                        explainController,
                        desController,
                      )) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(nameController.text),
                                  Text(dropdownValue),
                                  Text(ageController.text),
                                  Text(mPhone.text),
                                  Text(explainController.text),
                                  Text(statusController.text),
                                  Text(desController.text),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MSignup_2()));
                                      },
                                      child: const Text(
                                          'Move back to sign up page')),
                                  ElevatedButton(
                                    onPressed: () {
                                      _saveData();
                                      _uploadImageToStorage();
                                      showModalBottomSheet<void>(
                                        backgroundColor: Colors.deepPurpleAccent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 400,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      height: 200,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const <
                                                              Widget>[
                                                            Text(
                                                              'Thank You',
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .verified_rounded,
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
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        const SizedBox(
                                                          height: 14,
                                                        ),
                                                        const Center(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 12),
                                                            child: Text(
                                                                'We will get back to you within 48 hours shortly please check your mail'),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 12),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Colors
                                                                            .deepPurpleAccent)),
                                                            // Here Im having the error                                        ),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const MyApp()));
                                                            },
                                                            child: const Text(
                                                              'Go back to home page',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
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
                                    child: const Text('Check and click summit'),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Enter all the fields"),
                        ));
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

bool valc = false;

bool validate(name, age, phone, stat, explain, des) {
  if (name != null &&
      age != null &&
      phone != null &&
      stat != null &&
      explain != null &&
      des != null) {
    return true;
  } else {
    return false;
  }
}

class MyData {
  String name;
  String email;
  String gender;
  int age;
  int phone;
  String status;
  String explain;
  String description;
  List skills;
  String Url;
  bool verify;

  MyData(
      {required this.email,
        required this.name,
      required this.gender,
      required this.age,
      required this.phone,
      required this.status,
      required this.explain,
      required this.description,
      required this.skills,
      required this.Url,
      required this.verify});

  Map<String, dynamic> toJson() {
    return {
      'email':email,
      'name': name,
      'gender': gender,
      'age': age,
      'phone': phone,
      'status': status,
      'explain': explain,
      'description': description,
      'skills': skills,
      'Url': Url,
      'verify': verify,
    };
  }
}
