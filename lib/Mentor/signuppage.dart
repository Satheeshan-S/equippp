import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:equippp/spage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equippp/main.dart';
import 'dart:io';

List<String> list = <String>['Male', 'Female', 'Others'];
String dropdownValue = list.first;
String dropdownValue_2 = 'select';
final FirebaseFirestore _db = FirebaseFirestore.instance;

late final downloadUrl;
final ImagePicker _picker = ImagePicker();
File _image = File('');
bool _isShow = true;
String? get name => null;


Future<void> _saveData() async {
  final name = nameController.text;
  final gender = dropdownValue;
  final age = int.tryParse(ageController.text) ?? 0;
  final phone = int.tryParse(mPhone.text) ?? 0;
  final status = statusController.text;
  final explain = explainController.text;
  final description = desController.text;
  final skills = dropdownValue_2;
  final Url = downloadUrl;
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
  );
  await _db.collection('Mentor').doc().set(myData.toJson());
}

class MSignup extends StatelessWidget {
  const MSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: Msignupstate()),
      ),
    );
  }
}

class Msignupstate extends StatefulWidget {
  const Msignupstate({Key? key}) : super(key: key);

  @override
  State<Msignupstate> createState() => _MsignupstateState();
}

TextEditingController nameController = TextEditingController();
TextEditingController statusController = TextEditingController();
TextEditingController explainController = TextEditingController();
TextEditingController mPhone = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController desController = TextEditingController();

class _MsignupstateState extends State<Msignupstate> {
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
  void dispose() {
    nameController.dispose();
    statusController.dispose();
    explainController.dispose();
    mPhone.dispose();
    ageController.dispose();
    desController.dispose();
    super.dispose();
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
                  nameController.text = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                filled: true,
                hintText: 'Name?',
                labelText: 'Name *',
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
                  onPressed: ()  async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(()  {
                        _image = File(pickedFile.path);
                      });
                    }
                    setState(() {
                      _isShow = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MSignup_2()));
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
  @override
  void initState() {
    super.initState();
    _uploadImageToStorage();
  }
  Widget _buildImagePicker_2() {
    return Column(
      children: [
/*
        Visibility(
          visible: _isShow,
          child: ElevatedButton(
            onPressed: () async {
              _uploadImageToStorage();
              final pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              }
              setState(() {
                _isShow = false;
              });
            },
            child: const Text('Pick an image'),
          ),
        ),
*/
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

/*
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
*/

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
        SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue_2,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue_2 = newValue!;
                });
              },
              items: <String>[
                'select',
                'Computer Science',
                'Civil',
                'UPSC',
                'SSC'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                );
              }).toList(),
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
                    _uploadImageToStorage();
                    _saveData();
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
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, right: 12),
                                          child: Text(
                                              'We will get back to you within 48 hours shortly please check your mail'),
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
                                                        const MyApp()));
                                          },
                                          child: const Text(
                                            'Go back to home page',
                                            style:
                                                TextStyle(color: Colors.white),
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
    );
  }
}

class MyData {
  String name;
  String gender;
  int age;
  int phone;
  String status;
  String explain;
  String description;
  String skills;
  String Url;
  bool verify;

  MyData(
      {required this.name,
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
