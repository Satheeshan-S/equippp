import 'package:equippp/Mentor/signuppage.dart';
import 'package:equippp/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

String dropdownValue = 'select';

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

late final result;

void _pickFile() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);

  if (result == null) return;
}

class Msignupstate_2 extends StatefulWidget {
  const Msignupstate_2({Key? key}) : super(key: key);

  @override
  State<Msignupstate_2> createState() => _MsignupstateState_2();
}

class _MsignupstateState_2 extends State<Msignupstate_2> {
  String agevalue = '1';
  final TextEditingController mPhone = TextEditingController();

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
          child: Stack(children: <Widget>[
            GestureDetector(
              onTap: () {
                _pickFile();
              },
              child: const CircleAvatar(
                radius: 60,
                child: Text('H'),
              ),
            ),
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
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: <Widget>[
                                      const SizedBox(height: 14,),
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
                                              backgroundColor: MaterialStateProperty
                                                  .all<Color>(
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
                                            style: TextStyle(
                                                color: Colors.white),)),
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
