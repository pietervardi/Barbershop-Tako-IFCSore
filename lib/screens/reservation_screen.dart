import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/utils/appbar.dart';
import 'package:intl/intl.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController hourinput = TextEditingController();

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        hourinput.text = _time.format(context);
      });
    }
  }

  @override
  void initState() {
    dateinput.text = "";
    hourinput.text = "";
    super.initState();
  }

  List<Map<String, String>> haircuts = [
    {
      'name': 'Undercut',
      'values': 'under',
    },
    {
      'name': 'Buzz Cut',
      'values': 'buzz',
    },
    {
      'name': 'French Crop',
      'values': 'french',
    },
    {
      'name': 'Comma Hair',
      'values': 'comma',
    },
    {
      'name': 'Comb Over',
      'values': 'comb',
    },
    {
      'name': 'Mullet',
      'values': 'mullet',
    },
    {
      'name': 'Two Blocks',
      'values': 'two',
    },
    {
      'name': 'Fluffy',
      'values': 'fluffy',
    },
  ];

  List<String> barbersname = [
    'John Flick',
    'Sheid Hulian',
    'Alex Stone',
  ];

  bool? massage = false;
  bool? wash = false;
  bool? color = false;
  bool? modeling = false;
  bool extra = false;
  String? gayarambut;
  String? barbers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Reservation',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ))
              ],
            ),
            SizedBox(
              width: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  Name'),
                    TextFormField(
                      // controller: textFieldController1,
                      decoration: InputDecoration(
                          hintText: 'Enter name',
                          filled: true,
                          fillColor: inputField,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Text('  Hair Models'),
                    DropdownButtonFormField(
                        dropdownColor: inputField,
                        decoration: InputDecoration(
                            hintText: 'Choose Hair Model',
                            filled: true,
                            fillColor: inputField,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        value: gayarambut,
                        items: haircuts
                            .map((e) => DropdownMenuItem(
                                value: e["values"], child: Text(e["name"]!)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            gayarambut = value;
                          });
                        }),
                    const Padding(padding: EdgeInsets.all(10)),
                    Text('  Barbers'),
                    DropdownButtonFormField(
                        dropdownColor: inputField,
                        decoration: InputDecoration(
                            hintText: 'Choose Barber',
                            filled: true,
                            fillColor: inputField,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        value: barbers,
                        items: barbersname
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            barbers = value;
                          });
                        }),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputField,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement
                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextField(
                        controller: hourinput,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: inputField,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            icon: Icon(
                                Icons.timelapse_outlined), //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: _selectTime),
                    const Padding(padding: EdgeInsets.all(10)),
                    SwitchListTile(
                        title: Text('Extra Services'),
                        activeColor: Color.fromARGB(255, 168, 86, 30),
                        value: extra,
                        onChanged: (value) {
                          setState(() {
                            extra = value;
                          });
                        }),
                    const Padding(padding: EdgeInsets.all(10)),
                  ]),
            ),
            if (extra)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF6BA92)),
                width: 300,
                child: Column(
                  children: [
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 168, 86, 30),
                        title: Text('Massage'),
                        value: massage,
                        onChanged: (value) {
                          setState(() {
                            massage = value;
                          });
                        }),
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 168, 86, 30),
                        title: Text('Hair Wash'),
                        value: wash,
                        onChanged: (value) {
                          setState(() {
                            wash = value;
                          });
                        }),
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 168, 86, 30),
                        title: Text('Hair Coloring'),
                        value: color,
                        onChanged: (value) {
                          setState(() {
                            color = value;
                          });
                        }),
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 168, 86, 30),
                        title: Text('Hair Modeling'),
                        value: modeling,
                        onChanged: (value) {
                          setState(() {
                            modeling = value;
                          });
                        }),
                  ],
                ),
              ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 85, vertical: 20)),
                onPressed: () {
                  // Route route =
                  //     MaterialPageRoute(builder: (context) => ProfileScreen(email:textFieldController1.text,username:textFieldController2.text));
                  // Navigator.push(context, route);
                },
                child: const Text(
                  'Confirm Reservation',
                  style: TextStyle(fontSize: 15),
                )),
                const Padding(padding: EdgeInsets.all(15)),
          ],
        ),
      ),
    );
  }
}
