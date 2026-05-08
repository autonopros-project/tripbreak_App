import 'package:flutter/material.dart';

import '../../../../common_imports.dart';
import '../../../core/core/theme/colors.dart';
import '../../../core/core/theme/style.dart';
import '../../../core/core/utils/print.dart';
import '../../../core/core/utils/shared_preference.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/submit_btn.dart';
import '../provider/home_screen_provider.dart';



class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  late HomeProvider homeProvider;

  TextEditingController cylinderNoController = TextEditingController();
  TextEditingController cylinderPercentageController = TextEditingController();

  int? selectedCapacity;

  bool get isFormValid {
    return cylinderNoController.text.trim().isNotEmpty &&
        selectedCapacity != null &&
        int.tryParse(cylinderPercentageController.text.trim()) != null;
  }

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of(context, listen: false);
  }

  Future<void> _submitForm() async {
    final loginData = LocalStorages.getLoginModel();
    final plantPkey = loginData?.mItem2?.plantInfo?.firstOrNull?.plantPkey;

    if (plantPkey == null) {
      printDebug("❌ PlantPkey not found. Cannot submit form.");
      return;
    }

    // RegisterCylinderDetailsModel postData = RegisterCylinderDetailsModel(
    //   cylinderCapacity: selectedCapacity ?? 0,
    //   cylinderNumber: cylinderNoController.text.trim(),
    //   cylinderPercentage: int.tryParse(cylinderPercentageController.text.trim()) ?? 0,
    //   plantReferenceID: plantPkey,
    //   registeredBy: LocalStorages.getMobileNumber(),
    // );

    //printDebug("✅ Submitted Data: ${postData.toJson()}");
    await homeProvider.postIMSQInspectDetailsApiCall( homeProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                writtenText: "Cylinder Number*",
                textStyle: ThemeTextStyle.style(),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: cylinderNoController,
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 20),

              /// ✅ Use your `CustomDropdown` for Cylinder Capacity
              CustomDropdown<int>(
                labelStyle: ThemeTextStyle.style(),
                labelName: "Cylinder Capacity*",
                hintText: "Select Capacity",
                items: const [100, 1000],
                value: selectedCapacity,
                itemLabel: (value) => value.toString(),
                onChanged: (val) {
                  setState(() {
                    selectedCapacity = val;
                  });
                },
              ),
              const SizedBox(height: 20),

              CustomText(
                writtenText: "Cylinder Percentage*",
                textStyle: ThemeTextStyle.style(),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: cylinderPercentageController,
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 20),

              // Center(
              //   child: SubmitButtonFillWidget(
              //     onTap: _submitForm,
              //     text: 'Save',
              //     btnColor: ThemeColors.primaryColor,
              //     isEnabled: isFormValid,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
