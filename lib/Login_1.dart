import 'package:equippp/Learner/HomePages/lLogin.dart';
import 'package:equippp/Mentor/Mlogin.dart';
import 'package:flutter/material.dart';

class SLogin extends StatelessWidget {
  const SLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MSLogin(),
      ),
    );
  }
}

class MSLogin extends StatelessWidget {
  const MSLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 600,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("lib/images/sb.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 4)),
        const Center(
          child: Text(
            'Log In as',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const lLogin()));
                  },
                  child: const Text("Learner"),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                  },
                  child: const Text("Mentor"),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        const Center(
          child: Text(
            'we have 1000+ session and 1 lakhs mentors world wide',
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
