import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PreferencesContainer extends StatefulWidget {
  const PreferencesContainer({super.key});

  @override
  State<PreferencesContainer> createState() => _PreferencesContainerState();
}

class _PreferencesContainerState extends State<PreferencesContainer> {
  String flightSeat = 'Window';
  String roomType = 'Double';

  Widget preferenceDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE1E4E8), width: 1.5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            LucideIcons.chevronDown,
            size: 20,
            color: Color(0xff6B7280),
          ),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xff111827),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget sectionLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xff6B7280),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0xffE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preferences',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          sectionLabel('Flight Seat'),
          preferenceDropdown(
            value: flightSeat,
            items: const ['Window', 'Middle', 'Aisle'],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  flightSeat = value;
                });
              }
            },
          ),
          SizedBox(height: 16),
          sectionLabel('Hotel Room type'),
          preferenceDropdown(
            value: roomType,
            items: const ['Single', 'Double', 'Twin', 'Suite'],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  roomType = value;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
