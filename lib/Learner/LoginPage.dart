import 'package:equippp/Learner/MoLogin.dart';
import 'package:equippp/Learner/mailc.dart';
import 'package:equippp/Learner/service.dart';
import 'package:equippp/spage.dart';
import 'package:flutter/material.dart';

class LMPage extends StatefulWidget {

  const LMPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LMPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SApp()));
                    },
                    child: Image.asset("lib/images/images.png"),
                  )),
              const Padding(padding: EdgeInsets.only(top: 60)),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Sign in as Learner',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 26),
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
              Center(
                child: SizedBox(
                  height: 40,
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MoLoginApp()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'lib/images/top.jpg',
                              height: 40,
                              width: 40,
                            ),
                            const Text(
                              'Continue with Mobile',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(13)),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      onPressed: () async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MCPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'lib/images/google.png',
                              height: 40,
                              width: 40,
                            ),
                            const Text(
                              'Continue with Gmail',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Center(
                child: SizedBox(
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_right_outlined,
                      size: 24.0,
                    ),
                    label: const Text('Login'),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Center(
                child: TextButton(
                  onPressed: () {
                    null;
                  },
                  child: const Text(
                      'Dont have an account please register? Sign up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
