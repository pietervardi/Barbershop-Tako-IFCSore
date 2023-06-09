import 'package:barbershop_app/responsive/screen_layout.dart';
import 'package:barbershop_app/utils/message.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:barbershop_app/utils/global_variable.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  bool isLoading = false;

  void _confirmReservation() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const ScreenLayout(),
        ),
        (route) => false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        buildSnackBarSuccess('Melakukan Reservasi'),
      );
    });
  }
  
  TextEditingController dateinput = TextEditingController();
  TextEditingController hourinput = TextEditingController();

  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

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
    {
      'name': 'Custom Hair',
      'values': 'custom',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildTitleText('RESERVATION'),
              SizedBox(
                width: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        color: reservationText,
                        fontSize: 20
                      ),
                    ),
                    TextFormField(
                      // controller: textFieldController1,
                      decoration: InputDecoration(
                        hintText: 'Enter name',
                        filled: true,
                        fillColor: inputField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      ),
                      style: const TextStyle(
                        fontSize: 15
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      'Hair Models',
                      style: TextStyle(
                        color: reservationText,
                        fontSize: 20
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: inputField,
                      decoration: InputDecoration(
                        hintText: 'Choose Hair Model',
                        filled: true,
                        fillColor: inputField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      ),
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
                    if (gayarambut == 'custom')
                      Column(
                        children: [
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Custom Hair Models',
                              style: TextStyle(
                                color: reservationText,
                                fontSize: 20
                              ),
                            ),
                          ),
                          TextFormField(
                            // controller: textFieldController1,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Fill your preferences',
                              filled: true,
                              fillColor: inputField,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )
                            ),
                            style: const TextStyle(
                              fontSize: 15
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                    const Text(
                      'Barbers',
                      style: TextStyle(
                        color: reservationText,
                        fontSize: 20
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: inputField,
                      decoration: InputDecoration(
                        hintText: 'Choose Barber',
                        filled: true,
                        fillColor: inputField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      ),
                      value: barbers,
                      items: barbersname
                        .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
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
                        dateinput,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: inputField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                        icon: const Icon(Icons.calendar_today),
                        labelText: "Enter Date"
                      ),
                      readOnly:
                        true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                            2000
                          ),
                          lastDate: DateTime(2101)
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                            DateFormat('EEEE, d MMM yyyy').format(pickedDate);
                          setState(() {
                            dateinput.text = formattedDate;
                          });
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
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        icon: const Icon(
                          Icons.timelapse_outlined
                        ),
                        labelText: "Enter Time"
                      ),
                      readOnly:
                        true,
                      onTap: _selectTime
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SwitchListTile(
                      title: const Text(
                      'Extra Services',
                        style: TextStyle(
                          color: reservationText,
                          fontSize: 20
                        ),
                      ),
                      activeTrackColor: green,
                      activeColor: whiteText,
                      value: extra,
                      onChanged: (value) {
                        setState(() {
                          extra = value;
                        });
                      }
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                  ]
                ),
              ),
              if (extra)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inputField
                  ),
                  width: 300,
                  child: Column(
                    children: [
                      CheckboxListTile(
                        activeColor: const Color.fromARGB(255, 168, 86, 30),
                        title: const Text(
                          'Massage',
                          style: TextStyle(
                            color: reservationText,
                            fontSize: 15
                          ),
                        ),
                        value: massage,
                        onChanged: (value) {
                          setState(() {
                            massage = value;
                          });
                        }
                      ),
                      CheckboxListTile(
                        activeColor: const Color.fromARGB(255, 168, 86, 30),
                        title: const Text(
                          'Hair Wash',
                          style: TextStyle(
                            color: reservationText,
                            fontSize: 15
                          ),
                        ),
                        value: wash,
                        onChanged: (value) {
                          setState(() {
                            wash = value;
                          });
                        }
                      ),
                      CheckboxListTile(
                        activeColor: const Color.fromARGB(255, 168, 86, 30),
                        title: const Text(
                          'Hair Coloring',
                          style: TextStyle(
                            color: reservationText,
                            fontSize: 15
                          ),
                        ),
                        value: color,
                        onChanged: (value) {
                          setState(() {
                            color = value;
                          });
                        }
                      ),
                      CheckboxListTile(
                        activeColor: const Color.fromARGB(255, 168, 86, 30),
                        title: const Text(
                          'Hair Modeling',
                          style: TextStyle(
                            color: reservationText,
                            fontSize: 15
                          ),
                        ),
                        value: modeling,
                        onChanged: (value) {
                          setState(() {
                            modeling = value;
                          });
                        }
                      ),
                    ],
                  ),
                ),
              const Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  backgroundColor: reservationButton,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 85, vertical: 20)
                  ),
                onPressed: isLoading ? null : _confirmReservation,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Confirm Reservation'),
                ),
                const Padding(
                  padding: EdgeInsets.all(15)
                ),
            ],
          ),
        ),
      ),
    );
  }
}