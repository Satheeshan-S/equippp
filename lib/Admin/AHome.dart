import 'package:equippp/Admin/admin_1.dart';
import 'package:flutter/material.dart';
import 'admin_2.dart';


class ad extends StatelessWidget {
  const ad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Page'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const admin_1()))
                          },
                      child: const Text('Mentor details')),
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const admin_2()));
                      },
                      child: const Text('Session details')),
                )
              ],
            )
          ],
        ),
        body: const Text(''),
      ),
    );
  }
}
