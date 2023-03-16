import 'package:equippp/Mentor/HomePages/homePage_1.dart';
import 'package:equippp/main.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'ForgetPage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MLogin(),
      ),
    );
  }
}

final TextEditingController emailController = TextEditingController();
final bool isValid = EmailValidator.validate(emailController as String);

class MLogin extends StatefulWidget {
  const MLogin({Key? key}) : super(key: key);

  @override
  State<MLogin> createState() => _MLoginState();
}

class _MLoginState extends State<MLogin> {
  String _textFieldValue = '';

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
                    builder: (context) => const MyApp(),
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
            'Log In',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
            height: 60,
            width: 320,
            child: TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  filled: true,
                  hintText: 'Password',
                  labelText: 'Password ',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text(
                        "Forget?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forget()));
                      },
                    ),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 12),
          child: SizedBox(
              height: 60,
              width: 320,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MHome(name: _textFieldValue,)
                      ));
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
      ],
    );
  }
}
