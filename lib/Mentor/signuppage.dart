import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:equippp/Mentor/signup_2.dart';
import 'package:equippp/spage.dart';
import 'package:flutter/material.dart';

List<String> list = <String>['Male', 'Female', 'Others'];
String dropdownValue = list.first;

List<String> agelist = <String>['1', '2', '3','4'];

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
TextEditingController genderController = TextEditingController();
TextEditingController ageController = TextEditingController();

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
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
     nameController = TextEditingController();
    statusController = TextEditingController();
     explainController = TextEditingController();
     mPhone = TextEditingController();
     genderController = TextEditingController();
     ageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    statusController.dispose();
    explainController.dispose();
    mPhone.dispose();
    genderController.dispose();
    ageController.dispose();
    super.dispose();
  }
  Future<void> _saveData() async {
    final name = nameController.text;
    final gender=  genderController.toString();
    final age = int.tryParse(ageController.text) ?? 0;
    final phone= int.tryParse(mPhone.text)??0;
    final status=statusController.text;
    final explain= explainController.text;
    final myData = MyData(name: name, age: age,gender: gender,phone: phone,status: status,explain:explain);
    await _db.collection('Mentor').doc(name).collection('Mentor').add(myData.toJson());
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
                        genderController=newValue as TextEditingController;
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
                  child:TextFormField(
                    onChanged: (value){
                      setState(() {
                        ageController.text=value as String;
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
                  )
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              cursorColor: Colors.black87,
              controller: mPhone,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                setState(() {
                  mPhone.text = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                hintText: "Enter phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black87),
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
                      "${'+'}  ${selectedCountry.phoneCode}",
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
              onChanged: (value){
                setState(() {
                  statusController.text=value;
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
              onChanged: (value){
                setState(() {
                  explainController.text=value as String;
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
          child:SizedBox(height:40,width: 120,child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                onPressed: () {
                  _saveData();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MSignup_2()));
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
class MyData {
  String name;
  String gender;
  int age;
  int phone;
  String status;
  String explain;

  MyData({required this.name,required this.gender,required this.age, required  this.phone,required this.status,required this.explain});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender':gender,
      'age': age,
      'phone':phone,
      'status':status,
      'explain':explain
    };
  }
}
