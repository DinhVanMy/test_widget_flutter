import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  String selectedDateString = "";
  String selectedTimeString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDateString,
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                  print("Selected date is $selectedDate");
                  if (selectedDate != null) {
                    setState(() {
                      selectedDateString =
                          DateFormat("dd-MM-yyyy").format(selectedDate);
                    });
                  }
                },
                child: const Text("Select Date")),
            const SizedBox(
              height: 40,
            ),
            Text(
              selectedTimeString,
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                  if(selectedTime != null) {
                    setState(() {
                      selectedTimeString =
                          "${selectedTime.hour} : ${selectedTime.minute}";
                    });
                  }
                },
                child: const Text("Select Time"))
          ],
        ),
      ),
    );
  }
}
