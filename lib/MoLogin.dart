import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
void main() {
  runApp(const MoLoginApp());
}

class MoLoginApp extends StatelessWidget {
  const MoLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MoLoginpage(),
      ),
    );
  }
}

class MoLoginpage extends StatefulWidget {
  const MoLoginpage({super.key});

  @override
  _MLoginState createState() => _MLoginState();
}

class _MLoginState extends State<MoLoginpage> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: '+91',
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
    phoneController.selection = TextSelection.fromPosition(TextPosition(
      offset: phoneController.text.length,
    ));
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image.asset("lib/images/images.png"),
          ),
          const Padding(padding: EdgeInsets.only(top: 46)),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Login Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Hello,welcome back to Trag',
              style: TextStyle(fontSize: 10),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Phone Number',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Center(
            child: SizedBox(
              height: 45,
              width: 299,
              child: TextFormField(
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Phone Number',
                    hintStyle:  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.grey.shade600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black87)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.black87)),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 550),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          '${selectedCountry.flagEmoji} ${selectedCountry.phoneCode}',
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                            height: 5,
                            width: 10,
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
                  )),
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Center(
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right,
                size: 24.0,
              ),
              label: const Text('Request OTP'),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Center(
            child: TextButton(
              onPressed: () {
                null;
              },
              child:
                  const Text('Dont have an account please register? Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
