import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/homePage_1.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
final name_e=eventName;
class MEvent extends StatelessWidget {
  const MEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(child: Event()),
      ),
    );
  }
}

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

final FirebaseFirestore userEventDb = FirebaseFirestore.instance;

Future<bool> checkRandomNumber(int randomNumber) async {
  final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
      .instance
      .collection('Session')
      .where('id', isEqualTo: randomNumber)
      .get();
  if (result.docs.isEmpty) {
    return true;
  } else {
    return false;
  }
}

Future<bool> israndom() async {
  var random = Random();
  var randomNumber = random.nextInt(1000);
  id = randomNumber;
  if (await checkRandomNumber(randomNumber)) {
    return true;
  } else {
    return false;
  }
}

int id = 23;

Future<void> _saveData() async {
  if (await israndom()) {
    final id_2 = id;
    final name_9=name_e;
    final title = titleController.text;
    final meeting = typeValue;
    final time = _timeController.text;
    final date = dateController.text;
    final des = desController.text;
    final content1 = content1Controller.text;
    final content2 = content2Controller.text;
    final content3 = content3Controller.text;
    final content4 = content4Controller.text;
    const verify = false;
    final myData = UserEvent(
        email: name_9,
        title: title,
        date: date,
        time: time,
        Des: des,
        meeting: meeting,
        content1: content1,
        content2: content2,
        content3: content3,
        content4: content4,
        verify: verify,
        id_1: id_2);
    await userEventDb.collection('Sessions').doc().set(myData.toJson());
  } else {}
}

List<String> li = <String>['Education', 'Music', 'Cinematography'];
String typeValue = li.first;
TextEditingController titleController = TextEditingController();
TextEditingController _timeController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController desController = TextEditingController();
TextEditingController content1Controller = TextEditingController();
TextEditingController content2Controller = TextEditingController();
TextEditingController content3Controller = TextEditingController();
TextEditingController content4Controller = TextEditingController();

class UserEvent {
  final String email;
  final String title;
  final String date;
  final String time;
  final String Des;
  final String meeting;
  final String content1;
  final String content2;
  final String content3;
  final String content4;
  final id_1;
  bool verify;

  UserEvent(
      {required this.email,
        required this.id_1,
      required this.title,
      required this.date,
      required this.time,
      required this.Des,
      required this.meeting,
      required this.content1,
      required this.content2,
      required this.content3,
      required this.content4,
      required this.verify});

  Map<String, dynamic> toJson() {
    return {
      'email':email,
      'id': id_1,
      'title': title,
      'date': date,
      'time': time,
      'meeting': meeting,
      'des': Des,
      'content1': content1,
      'content2': content2,
      'content3': content3,
      'content4': content4,
      'verify': verify,
    };
  }
}

class _EventState extends State<Event> {
  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: DateTime.now().toString());
    titleController = TextEditingController();
    _timeController = TextEditingController();
    dateController = TextEditingController();
    desController = TextEditingController();
    content1Controller = TextEditingController();
    content2Controller = TextEditingController();
    content3Controller = TextEditingController();
    content4Controller = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    _timeController.dispose();
    dateController.dispose();
    desController.dispose();
    content1Controller.dispose();
    content2Controller.dispose();
    content3Controller.dispose();
    content4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  MHome(
                                name: name_e,
                              )));
                },
                icon: const Icon(Icons.backspace),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 75),
                child: Text(
                  'Meeting overview',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MHome(
                                  name: name_e,
                                )));
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, bottom: 0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Meeting Title',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    titleController.text = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Title*',
                ))),
        const Padding(
          padding: EdgeInsets.only(left: 25, bottom: 0, top: 5, right: 18),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Agenda over welcome (15 minutes) Describe the purposes of the meeting Read More',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ),
        Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 5, top: 15, right: 18),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Due Date',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, bottom: 5, top: 15, right: 18),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    hintText: 'Select Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    );
                    if (selectedDate != null) {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  },
                ),
              ),
            ),
            SizedBox(
                height: 40,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: TextField(
                    controller: _timeController,
                    decoration: const InputDecoration(
                      hintText: 'Select Time',
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    onTap: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        _timeController.text = selectedTime.format(context);
                      }
                    },
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 7),
              child: Text(
                'Topic Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          width: 320,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                desController.text = value;
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 45.0,
              ),
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '    Add some description',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
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
        const SizedBox(
          height: 12,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 15),
              child: Text(
                'Type of Meeting',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 15),
            child: SizedBox(
                height: 40,
                width: 170,
                child: DropdownButtonFormField(
                  value: typeValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      typeValue = newValue!;
                    });
                  },
                  icon: const Icon(Icons.arrow_downward_sharp),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    labelText: '',
                    hintText: 'Education',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white), //<-- SEE HERE
                    ),
                  ),
                  dropdownColor: Colors.white,
                  items: <String>['Education', 'Music', 'Cinematography']
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
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 7),
              child: Text(
                'Content',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                content1Controller.text = value;
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '1. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                content2Controller.text = value;
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '2. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                content3Controller.text = value;
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '3. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                content4Controller.text = value;
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '4. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ))),
              onPressed: () {
                _saveData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  MHome(name: name_e)));
              },
              child: Text('Continue & Send Invitation')),
        )
      ],
    );
  }
}
