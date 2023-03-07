import 'package:equippp/Mentor/signuppage.dart';
import 'package:flutter/material.dart';

String dropdownValue = 'Computer Science';

class MSignup_2 extends StatelessWidget {
  const MSignup_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.brown.shade800,
              child: const Text('H'),
            ),
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
          padding: EdgeInsets.only(left: 18, right: 18),
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
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            dropdownColor: Colors.white,
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Computer Science', 'Civil', 'UPSC', 'SSC']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MSignup_2()));
                },
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Request'),
              )),
          ),
        )
      ],
    );
  }
}
