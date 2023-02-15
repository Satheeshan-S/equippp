import 'package:equippp/Provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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
            padding: EdgeInsets.only(left: 33),
            child: Text(
              'Login Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Padding(
            padding: EdgeInsets.only(left: 33),
            child: Text(
              'Hello,welcome back to Trag',
              style: TextStyle(fontSize: 10),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          const Padding(
            padding: EdgeInsets.only(left: 33),
            child: Text(
              'Phone Number',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: TextFormField(
              cursorColor: Colors.black87,
              controller: phoneController,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                setState(() {
                  phoneController.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
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
                suffixIcon: phoneController.text.length > 9
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
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 45,
            child: Center(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: () => sendPhoneNumber(),
                icon: const Icon(
                  Icons.arrow_right,
                  size: 24.0,
                ),
                label: const Text('Request OTP'),
              ),
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

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, '+${selectedCountry.phoneCode}$phoneNumber');
  }
}
