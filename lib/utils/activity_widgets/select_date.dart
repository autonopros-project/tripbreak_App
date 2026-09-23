import 'package:flutter/material.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';

class SelectDate extends StatefulWidget {
  final String date;
  const new({super.key, required this.date});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? selectedDate;

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDate,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Color(0xff76767640)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: widget.date,
                size: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff767676),
              ),
              SizedBox(height: 8),
              CustomText(
                text: selectedDate == null
                    ? 'Select Date'
                    : '${selectedDate!.day.toString().padLeft(2, '0')}-'
                          '${selectedDate!.month.toString().padLeft(2, '0')}-'
                          '${selectedDate!.year}',
                size: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
