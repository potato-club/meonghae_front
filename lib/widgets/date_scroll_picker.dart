import 'package:flutter/material.dart';

class DateScrollPicker extends StatefulWidget {
  const DateScrollPicker({super.key});

  @override
  _DateScrollPickerState createState() => _DateScrollPickerState();
}

class _DateScrollPickerState extends State<DateScrollPicker> {
  final ScrollController _scrollController = ScrollController();
  int _selectedDate = 1; // Initially selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 31,
          itemBuilder: (context, index) {
            final date = index + 1;
            final isSelected = date == _selectedDate;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = date;
                });
              },
              child: Container(
                height: 60,
                color: isSelected ? Colors.green : Colors.white,
                child: Center(
                  child: Text(
                    date.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
