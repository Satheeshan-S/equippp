import 'package:equippp/Mentor/HomePages/homePage_1.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MEvent extends StatelessWidget {
  const MEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(child: Event()),
      ),
    );
  }
}

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

void main() {
  runApp(const MEvent());
}

TextEditingController _timeController = TextEditingController();

class _EventState extends State<Event> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children:  <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MHome(name: null,)));
                },
                icon: const Icon(Icons.backspace),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 75),
                child: Text(
                  'Meeting overview',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MHome(name: null,)));
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, bottom: 0),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Meeting Title',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
                decoration: const InputDecoration(
              labelText: 'Title*',
            ))),
        const Padding(
          padding: EdgeInsets.only(left: 25, bottom: 0, top: 5, right: 18),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Agenda over welcome (15 minutes) Describe the purposes of the meeting Read More',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ),
        Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 5, top: 15, right: 18),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Due Date',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 75, bottom: 5, top: 15, right: 18),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    hintText: 'Select Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    );
                    if (selectedDate != null) {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  },
                ),
              ),
            ),
            SizedBox(
                height: 40,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: TextField(
                    controller: _timeController,
                    decoration: const InputDecoration(
                      hintText: 'Select Time',
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    onTap: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        _timeController.text = selectedTime.format(context);
                      }
                    },
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 7),
              child: Text(
                'Topic Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          width: 320,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 45.0,
              ),
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: 'Add some description',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25, bottom: 7),
              child: Text(
                'Content',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '1. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '2. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '3. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.2),
              filled: true,
              hintText: '',
              labelText: '4. Add some content',
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
         SizedBox(
           width: 300,
           child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
              onPressed: () {
                null;
              }, child: const Text('Continue & Send Invitation')),
         )
      ],
    );
  }
}
