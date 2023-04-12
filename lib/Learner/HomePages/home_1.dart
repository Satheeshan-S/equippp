import 'package:equippp/Learner/HomePages/lEvent.dart';
import 'package:equippp/Learner/HomePages/lProfile.dart';
import 'package:flutter/material.dart';

String lName = 'jhvbh';

class LHome extends StatelessWidget {
  const LHome({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomAppBarExample(name),
      ),
    );
  }
}

class BottomAppBarExample extends StatefulWidget {
  BottomAppBarExample(this.name);

  final name;

  @override
  _DemoBottomAppBar createState() => _DemoBottomAppBar(name);
}

class _DemoBottomAppBar extends State<BottomAppBarExample> {
  @override
  void initState() {
    super.initState();
    setState(() {
      lName = name;
    });
  }

  _DemoBottomAppBar(this.name);

  final name;
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    LHome_2(),
    LEvent(),
    LProfile(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  bool isPressed_1 = false;
  bool isPressed_2 = false;
  bool isPressed_3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.topCenter,
          child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 100,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon:  Icon(Icons.home,color: isPressed_1 ? Colors.orange : Colors.black),
                      onPressed: () {
                        setState(() {
                          isPressed_1 = !isPressed_1;
                          isPressed_2 = false;
                          isPressed_3 = false;
                        });
                        _onItemTapped(0);
                      }),
                  IconButton(
                    icon:  Icon(Icons.calendar_today,color: isPressed_2 ? Colors.orange : Colors.black),
                    onPressed: () {
                      setState(() {
                        isPressed_1 = false;
                        isPressed_2 = !isPressed_2;
                        isPressed_3 = false;
                      });
                      _onItemTapped(1);
                    },
                  ),
                  IconButton(
                    icon:  Icon(Icons.person,color: isPressed_3 ? Colors.orange : Colors.black),
                    onPressed: () {
                      setState(() {
                        isPressed_1 = false;
                        isPressed_2 = false;
                        isPressed_3 = !isPressed_3;
                      });
                      _onItemTapped(2);
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class LHome_2 extends StatelessWidget {
  const LHome_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LHome_2State(),
      ),
    );
  }
}

class LHome_2State extends StatefulWidget {
  const LHome_2State({Key? key}) : super(key: key);

  @override
  State<LHome_2State> createState() => _LHome_2StateState();
}

class _LHome_2StateState extends State<LHome_2State> {
  @override
  Widget build(BuildContext context) {
    return Text('homepage');
  }
}
