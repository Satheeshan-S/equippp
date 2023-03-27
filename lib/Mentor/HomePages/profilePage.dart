import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'homePage_1.dart';

TextEditingController mPhoneP = TextEditingController();

class MProfile extends StatelessWidget {
  const MProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(child: Profile()),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Country selectedCountryP = Country(
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
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        builder: (context) => const MHome(
                              name: null,
                            )));
              },
              icon: const Icon(Icons.backspace),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      ClipOval(
        child: SizedBox.fromSize(
            size: const Size.fromRadius(50),
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/equipp-app.appspot.com/o/Mentor%2FNithin%20%2FNithin%20.jpg?alt=media&token=9b20622b-c86b-4e6e-a68b-e5a8dc0800c2')),
      ),
      const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8), child: Text('Name')),
      const Text('Current status'),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Text('About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text(
              'a statement that tells you how something or someone looks, sounds, etc. : words that describe something or someone. [count] Reporters called the scene “a disaster area,” and I think that was an accurate description. I applied '),
        ),
      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Text('Achievements',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text(
              'a statement that tells you how something or someone looks, sounds, etc. : words that describe something or someone. [count] Reporters called the scene “a disaster area,” and I think that was an accurate description. I applied '),
        ),
      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.all(7),
            child: Text('Skills',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 20,
                width: 150,
                child: Text(
                  'Computer Science',
                  style: TextStyle(backgroundColor: Colors.grey.shade50),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 20,
                width: 160,
                child: Text(
                  'Environment Studies',
                  style: TextStyle(backgroundColor: Colors.grey.shade50),
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 20,
                width: 150,
                child: Text(
                  'Physic teaching',
                  style: TextStyle(backgroundColor: Colors.grey.shade50),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 20,
                width: 160,
                child: Text(
                  'Social Science',
                  style: TextStyle(backgroundColor: Colors.grey.shade50),
                ),
              ),
            ),
          ),
        ],
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 5,top: 15, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  mPhoneP.text = value;
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
                              selectedCountryP = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedCountryP.flagEmoji} + ${selectedCountryP.phoneCode}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                suffixIcon: mPhoneP.text.length > 9
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
      ),
    ]);
  }
}
/*
rules_version = '2';
service cloud.firestore {
match /databases/{database}/documents {
match /{document=**} {
allow read;
allow write;
}
}
}
*/
