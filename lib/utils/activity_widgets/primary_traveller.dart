import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PrimaryTraveler extends StatefulWidget {
  const PrimaryTraveler({super.key});

  @override
  State<PrimaryTraveler> createState() => _PrimaryTravelerState();
}

class _PrimaryTravelerState extends State<PrimaryTraveler> {
  String? month;
  String? date;
  String? year;
  String? nationality;
  String? verificationType;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final verificationIdController = TextEditingController();
  final borderColor = Color(0xffE5E7EB);
  final labelColor = Color(0xff767676);

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    verificationIdController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff9CA3AF),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: Color(0xff00388C), width: 1),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
      ),
    );
  }

  Widget dropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      icon: Icon(LucideIcons.chevronDown, size: 18, color: Color(0xff6B7280)),
      decoration: inputDecoration(),
      hint: Text(
        hint,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xff9CA3AF),
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(fontSize: 14)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xffE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Primary traveler',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label('First Name'),
                    TextField(
                      controller: firstNameController,
                      decoration: inputDecoration(hintText: 'First Name'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label('Last Name'),
                    TextField(
                      controller: lastNameController,
                      decoration: inputDecoration(hintText: 'Last Name'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          label('Date of Birth'),
          Row(
            children: [
              Expanded(
                child: dropdown(
                  value: month,
                  hint: 'Month',
                  items: const [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December',
                  ],
                  onChanged: (value) {
                    setState(() {
                      month = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: dropdown(
                  value: date,
                  hint: 'Date',
                  items: List.generate(31, (index) => '${index + 1}'),
                  onChanged: (value) {
                    setState(() {
                      date = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: dropdown(
                  value: year,
                  hint: 'Year',
                  items: List.generate(
                    100,
                    (index) => '${DateTime.now().year - index}',
                  ),
                  onChanged: (value) {
                    setState(() {
                      year = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          label('Nationality'),
          dropdown(
            value: nationality,
            hint: 'Nationality',
            items: const [
              'Indian',
              'American',
              'British',
              'Canadian',
              'Australian',
              'Other',
            ],
            onChanged: (value) {
              setState(() {
                nationality = value;
              });
            },
          ),
          const SizedBox(height: 12),
          label('Verification ID'),
          Row(
            children: [
              SizedBox(
                width: 65,
                child: dropdown(
                  value: verificationType,
                  hint: 'PAN',
                  items: const ['PAN', 'Aadhaar', 'Passport'],
                  onChanged: (value) {
                    setState(() {
                      verificationType = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: verificationIdController,
                  obscureText: true,
                  decoration: inputDecoration(hintText: '********9V'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
