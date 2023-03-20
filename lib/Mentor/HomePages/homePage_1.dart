import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equippp/Mentor/HomePages/EventPage.dart';
import 'package:flutter/material.dart';


class MHome extends StatelessWidget {
  const MHome({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomAppBar(
          child: _DemoBottomAppBar(name),
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar(this.name);

  final name;

  setState() {
    name_1 = name;
  }

  @override
  Widget build(BuildContext context) {
    /*DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
          actions: [
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.calendar_today),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        )));
  */
    return Scaffold(
      body: HomeBody(name),
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MEvent()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.notification_add),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*  floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),*/
    );
  }
}
late final name_1;
late final imageUrl;
late final explain;
class HomeBody extends StatefulWidget {
  const HomeBody(
    this.name, {
    Key? key,
  }) : super(key: key);
  final name;

  @override
  State<HomeBody> createState() => _HomeBodyState(name);
}

class _HomeBodyState extends State<HomeBody> {
  _HomeBodyState(this.name);
  final name;
  Future<void> fetchUserData() async {
    final DocumentReference userDocRef =
    FirebaseFirestore.instance.collection('Mentor').doc('Satheeshan');

    final DocumentSnapshot userData = await userDocRef.get();

    explain = userData.get('gender');
    print('$explain');
  }
  setstate(){
    name_1=name;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$name'),
        const CircleAvatar(
          radius: 30,
        ),
        ElevatedButton(onPressed: fetchUserData,child: Text('ckdjcbdjh'))
      ],
    );
  }
}
Future<void> fetchUserData() async {
    final DocumentReference _db = FirebaseFirestore.instance.collection('Mentor').doc(name_1) as DocumentReference<Object?>;
    final DocumentSnapshot user= _db.get() as DocumentSnapshot<Object?>;
    explain=user.get('Url');
    print('$explain');
    /*final DocumentReference userDocRef =
    FirebaseFirestore.instance.collection('Mentor').doc(name_1);

    final DocumentSnapshot userData = await userDocRef.get();

    if (userData.exists) {
      explain = userData.get('explain');
      imageUrl = userData.get('Url');
      print('$imageUrl');
    } else {}
  } catch (e) {}*/
}

