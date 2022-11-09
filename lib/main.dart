import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime date = DateTime.now();
  selectdDate(BuildContext context, DateTime date) {
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Picker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Ingrese fecha de nacimiento",
                  hintText: '${date.year}/${date.month}/${date.day}',
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? onNewDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (onNewDate == null) return;
                  setState(() => date = onNewDate);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
