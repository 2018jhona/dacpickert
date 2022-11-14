import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  selectdDate() {
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );
  }

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("DATA PICKER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_todayy),
                labelText: "Ingrese Fecha de Nacimiento",
                hintText: '${date.year}/${date.month}/${date.day}',
              ),
              readOnly: true,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2110),
                );
                if (newDate == null) return;
                setState(() => date = newDate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
