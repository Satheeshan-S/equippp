import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Learner/HomePages/home_1.dart';
import 'package:equippp/Learner/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';
import '../Provider/auth_provider.dart';
import '../Provider/utils.dart';

class OTPPage extends StatefulWidget {
  final String verificationId;
  final String phone;

  const OTPPage({
    Key? key,
    required this.verificationId,
    required this.phone,
  }) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState(phone);
}

class _OTPPageState extends State<OTPPage> {
  final phonenum;

  _OTPPageState(this.phonenum);

  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black87,
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 30),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const Center(
                              child: Text(
                            'OTP',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            height: 200,
                            padding: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "lib/images/otp.jpg",
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Verification",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'We have sent the verification code to your mobile number',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Pinput(
                            length: 6,
                            showCursor: true,
                            defaultPinTheme: PinTheme(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.green.shade200,
                                    )),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                            onCompleted: (value) {
                              setState(() {
                                otpCode = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                              ),
                              onPressed: () async {
                                final snapshot = await FirebaseFirestore
                                    .instance
                                    .collection('Learner')
                                    .where('phone', isEqualTo: phonenum)
                                    .get();
                                if (snapshot.docs.isNotEmpty) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               LHome(email: 'false', phone: phonenum)));
                                } else if (otpCode != null) {
                                  verifyOtp(context, otpCode!, phonenum);
                                  showSnackBar(context, 'OTP verified');
                                } else {
                                  showSnackBar(context, 'Enter 6-Digit code');
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_right_outlined,
                                size: 24.0,
                              ),
                              label: const Text('Verify'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Didn't receive any code?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Resend New Code",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp, String phoneNumber) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Uapp(
                          phone: phoneNumber,
                          email: 'false',
                        )),
              );
            }
          });
        });
  }
}
