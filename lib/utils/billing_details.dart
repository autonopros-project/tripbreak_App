import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({super.key});

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  final billingNameController = TextEditingController();

  final billingAddressController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();

  String? selectedState = 'Select state';

  bool sameAsTraveller = true;

  final List<String> states = [
    'Select state',
    'Bihar',
    'Madhya Pradesh',
    'Maharashtra',
    'Delhi',
    'Kerala',
    'Uttar Pradesh',
    'Rajasthan',
    'Gujarat',
  ];

  @override
  void dispose() {
    billingNameController.dispose();
    billingAddressController.dispose();
    cityController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:  TextStyle(fontSize: 11, color: Color(0xffA5A5A5)),
      contentPadding:  EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      filled: true,
      fillColor:  Color(0xffFAFAFA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color: Color(0xffEEEEEE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color: Color(0xffEEEEEE)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide(color: Color(0xff00388C)),
      ),
    );
  }

  Widget fieldLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xff6C6C6C),
        ),
      ),
    );
  }

  Widget textField({
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 41,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: fieldDecoration(hintText: hintText),
      ),
    );
  }

  Widget stateDropdown() {
    return SizedBox(
      height: 38,
      child: DropdownButtonFormField<String>(
        initialValue: selectedState,
        isExpanded: true,
        icon: Icon(LucideIcons.chevronDown, size: 14, color: Color(0xff767676)),
        style:  TextStyle(fontSize: 11, color: Color(0xff1D1D1F)),
        decoration: fieldDecoration(),
        items: states.map((state) {
          return DropdownMenuItem<String>(
            value: state,
            child: Text(state, overflow: TextOverflow.ellipsis),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedState = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Billing Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          fieldLabel('Billing Name'),
          textField(
            controller: billingNameController,
            hintText: 'Ravi Kumar Chaurasiya',
          ),
          SizedBox(height: 16),
          fieldLabel('Billing Address'),
          textField(
            controller: billingAddressController,
            hintText: 'Enter your billing address',
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fieldLabel('City'),
                    textField(
                      controller: cityController,
                      hintText: 'Enter city',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [fieldLabel('State'), stateDropdown()],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fieldLabel('PIN Code'),
                    textField(
                      controller: pinCodeController,
                      hintText: 'Enter PIN code',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fieldLabel('Country'),
                    textField(controller: TextEditingController(text: 'India')),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  value: sameAsTraveller,
                  activeColor: const Color(0xff00388C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  onChanged: (value) {
                    setState(() {
                      sameAsTraveller = value ?? false;
                    });
                  },
                ),
              ),
              SizedBox(width: 4),
              Text(
                'Same as traveller details',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
