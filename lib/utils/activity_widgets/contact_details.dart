import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  String countryCode = '+91';

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 15, color: Color(0xff9CA3AF)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: Color(0xffE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(color: Color(0xff00388C)),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 14),
          label('Email'),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration(hintText: 'johndoe@gmail.com'),
          ),
          SizedBox(height: 12),
          label('Phone number'),
          Row(
            children: [
              Container(
                width: 66,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE5E7EB)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: countryCode,
                    isExpanded: true,
                    icon: const Icon(
                      LucideIcons.chevronDown,
                      size: 16,
                      color: Color(0xff767676),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    items: const [
                      DropdownMenuItem(value: '+91', child: Text('+91')),
                      DropdownMenuItem(value: '+1', child: Text('+1')),
                      DropdownMenuItem(value: '+44', child: Text('+44')),
                      DropdownMenuItem(value: '+61', child: Text('+61')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          countryCode = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: inputDecoration(hintText: '7885315821'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
