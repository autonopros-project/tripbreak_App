import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:trip_break_final/screens/trip_plan/trip_summary.dart';
import 'package:trip_break_final/utils/custom_widgets/custom_text.dart';
import 'package:trip_break_final/utils/activity_widgets/person_select.dart';
import 'package:trip_break_final/utils/activity_widgets/select_date.dart';
import 'package:trip_break_final/utils/custom_widgets/helper.dart';

class PlanTrip extends StatefulWidget {
  const new({super.key});

  @override
  State<PlanTrip> createState() => _PlanTripState();
}

class _PlanTripState extends State<PlanTrip> {
  TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool showSuggestions = false, showPackages = false, showPlace = true;
  final List<Map<String, String>> destinations = [
    {"name": "Goa", "state": "Goa"},
    {"name": "Manali", "state": "Himachal Pradesh"},
    {"name": "Jaipur", "state": "Rajasthan"},
    {"name": "Kerala Backwaters", "state": "Kerala"},
    {"name": "Leh", "state": "Ladakh"},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Planning your trip',
          size: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Where are you traveling?',
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onChanged: (value) {
                            setState(() {
                              showSuggestions = value.isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(LucideIcons.search, size: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (showSuggestions)
                        Builder(
                          builder: (context) {
                            final filteredDestinations = destinations
                                .where(
                                  (e) => e["name"]!.toLowerCase().contains(
                                    controller.text.toLowerCase(),
                                  ),
                                )
                                .toList();

                            if (filteredDestinations.isEmpty) {
                              return Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Text(
                                  'No destinations found',
                                  style: TextStyle(color: Color(0xff6E6E73)),
                                ),
                              );
                            }

                            return Container(
                              margin: const EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              constraints: const BoxConstraints(maxHeight: 250),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredDestinations.length,
                                itemBuilder: (context, index) {
                                  final item = filteredDestinations[index];
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: Color(0xffEEF3FF),
                                      child: Icon(
                                        Icons.landscape,
                                        color: Color(0xff1E3A8A),
                                      ),
                                    ),
                                    title: Text(
                                      item["name"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(item["state"]!),
                                    trailing: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Popular',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    onTap: () {
                                      controller.text = item["name"]!;
                                      setState(() {
                                        showSuggestions = false;
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          CustomText(
                            text: 'Select your travel dates',
                            size: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SelectDate(date: 'START DATE'),
                              SelectDate(date: 'END DATE'),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text: "Tell us who’s going on this trip",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  PersonSelect(tag: 'Adult', age: '18-59 years old'),
                  SizedBox(height: 8),
                  PersonSelect(tag: 'Children', age: '3-17 years old'),
                  SizedBox(height: 8),
                  PersonSelect(tag: 'Infants', age: '0-2 years old'),
                  SizedBox(height: 8),
                  PersonSelect(tag: 'Elders', age: '60+ years old'),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showPlace)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xff00388C),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: const Text(
                            'Kerala',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff00388C),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showPlace = false;
                          },
                          child: Positioned(
                            top: -2,
                            right: -2,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.white,
                              child: Icon(
                                LucideIcons.x,
                                size: 16,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => TripSummary(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffe55c),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff00388C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Helper(),
    );
  }
}
