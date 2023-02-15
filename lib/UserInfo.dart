import 'package:flutter/material.dart';
class Uapp extends StatelessWidget{
  const Uapp({super.key});
  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     home: Scaffold(
       body: UserInformation(),
     ),
   );
  }}
class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return const Text('logged in successfully');
  }
}
