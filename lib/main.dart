import 'dart:math';

import 'package:flutter/material.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:intl/intl.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget{


  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _date = TextEditingController();
  TimeOfDay? _selectedTime;
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SCHEDULE DELIVERY',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue,
            ),
          ),

          //Needs the home page to link back to
          leading: BackButton(

          ),
        ),
        body:SingleChildScrollView(
            child: Form(
                child: Column(

                  children: [
                    const Text(
                      "Delivery detail: ",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter your detail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Delivery address'),
                        hintText: 'Enter your address',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: _date,
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter the date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_today),
                        label: const Text('Preferred date'),
                        hintText: 'Enter the date',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                        // The functionality of the date need to be issued
                        // reason is it's not displaying on the screen
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                        if(pickeddate != null){
                          setState(() {
                            _date.text = DateFormat('yyyy-mm-dd').format(pickeddate);
                          });
                        }
                      }
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                  controller: _timeController,
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Please enter the time';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.access_alarm_sharp),
                    label: const Text('Preferred time'),
                    hintText: 'Enter the time',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                        // The functionality of the time need to be issued
                        // same reason with the date problem
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime ?? TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _selectedTime = pickedTime;
                          _timeController.text = _selectedTime!.format(context);
                        });
                      }
                    }
                  ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter your additional instruction';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Special instruction'),
                        hintText: 'Enter your instruction',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),

                    // Needs the booking page to submit to
                    // And need to linked in the database
                    ElevatedButton(
                        onPressed: () {},
                        child: Text("Submit"),
                    )
                  ],
                )
            ),
        ),
      ),
    );
  }
}
