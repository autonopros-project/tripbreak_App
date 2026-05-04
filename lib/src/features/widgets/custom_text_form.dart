import 'package:dropdown_search/dropdown_search.dart';
import 'package:tripBreak/src/core/core/utils/extension.dart';

import '../../../common_imports.dart';
import '../../core/core/theme/colors.dart';
import '../../core/core/theme/style.dart';
import '../../core/core/utils/show_dialogs.dart';
import '../../core/core/utils/utils.dart';
import 'custom_icon.dart';
import 'custom_text.dart';

/// Custom Text Form Field with label text
class CustomLabelTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final TextStyle labelTextStyle;
  final TextStyle? hintTextStyle;
  final List<TextInputFormatter>? inputFormatters;

  const CustomLabelTextFormField({
    required this.labelText,
    required this.controller,
    required this.focusNode,
    required this.labelTextStyle,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.onChanged,
    super.key,
    this.maxLines = 1,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintTextStyle,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // CustomText(writtenText: labelText, textStyle: labelTextStyle),
            RichText(
              text: TextSpan(
                children: _buildLabelTextSpans(labelText, labelTextStyle),
              ),
            ),
            8.ph,
            FormField<String>(
                autovalidateMode: autovalidateMode,
                validator: validator,
                initialValue: controller.text,
                builder: (FormFieldState<String> field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: field.hasError
                                  ? Colors.red
                                  : ThemeColors.greyColor,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: suffix != null ? 8.0 : 0.0),
                          child: TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            // autovalidateMode: autovalidateMode,
                            // validator: validator,
                            maxLines: maxLines,
                            keyboardType: keyboardType,
                            obscureText: obscureText,
                            // onChanged:  onChanged,
                            onChanged: (String value) {
                              field.didChange(value);
                              if (onChanged != null) {
                                onChanged!(value);
                              }
                            },

                            inputFormatters: inputFormatters,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 10.0, top: suffix != null ? 8.0 : 0.0),
                              border: InputBorder.none,
                              hintText: hintText,
                              prefix: prefix,
                              suffix: suffix,
                              hintStyle: hintTextStyle,
                            ),
                          ),
                        ),
                      ),
                      if (field.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                          child: CustomText(
                            writtenText: field.errorText ?? '',
                            textStyle: ThemeTextStyle.style(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                    ],
                  );
                }),
          ],
        ),
      );

  List<TextSpan> _buildLabelTextSpans(
      String labelText, TextStyle labelTextStyle) {
    final List<TextSpan> spans = <TextSpan>[];
    final List<String> parts = labelText.split('*');
    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i], style: labelTextStyle));
      if (i < parts.length - 1) {
        spans.add(TextSpan(
            text: '*', style: labelTextStyle.copyWith(color: Colors.red)));
      }
    }
    return spans;
  }
}

///NORMAL TEXT FORM FIELD
class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool enabled; // To control if the field is enabled or disabled
  final InputBorder? border; // To customize the input border
  final Color? fillColor; // For background color
  final TextStyle? textStyle; // For the text inside the field
  final bool isReadOnly;

  const CustomTextFormField({
    required this.controller,
    required this.focusNode,
    this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    super.key,
    this.maxLines = 1,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.labelTextStyle,
    this.hintTextStyle,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true, // Default to enabled
    this.border, // Allow custom border
    this.fillColor, // Allow background color
    this.textStyle, // Allow custom text style
    this.isReadOnly=false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isReadOnly,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autovalidateMode: autovalidateMode,
        maxLines: maxLines,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        enabled: enabled,  // Use the enabled property to control if the field is interactive
        style: enabled
            ? textStyle  // Custom text style when enabled
            : TextStyle(color: Colors.grey),  // Grey out the text when disabled
        decoration: InputDecoration(
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText,
          labelStyle: labelTextStyle,  // Custom label text style
          hintStyle: hintTextStyle,    // Custom hint text style
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: enabled
              ? fillColor ?? Colors.white  // White background when enabled
              : Colors.grey[200],  // Light grey background when disabled
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Default border style
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              ),
          enabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
          disabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              ),
        ),
      ),
    );
  }
}


///DROPDOWN
class CustomDropdown<T> extends StatelessWidget {
  final TextStyle labelStyle;
  final AutovalidateMode? autovalidateMode;
  final List<T> items;
  final T? value;
  final String hintText;
  final String Function(T) itemLabel;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final String labelName;
  final double dropdownBoxMinHeight;
  final bool showSearchBox;

  const CustomDropdown({
    required this.labelStyle,
    required this.items,
    required this.itemLabel,
    required this.hintText,
    required this.labelName,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.value,
    this.onChanged,
    this.validator,
    this.dropdownBoxMinHeight = 200,
    this.showSearchBox = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: _buildLabelTextSpans(labelName, labelStyle),
          ),
        ),
        8.ph,
        FormField<T>(
            autovalidateMode: autovalidateMode,
            validator: validator,
            initialValue: value,
            builder: (FormFieldState<T> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          // color: ThemeColors.greyColor,
                          color: state.hasError
                              ? Colors.red
                              : ThemeColors.greyColor,
                        )),
                    child: DropdownSearch<T>(
                        // autoValidateMode: autovalidateMode,
                        items: items,
                        selectedItem: value,
                        itemAsString: itemLabel,
                        // onChanged: onChanged,
                        // validator: validator,
                        onChanged: (T? val) {
                          state.didChange(val);
                          if (onChanged != null) {
                            onChanged!(val);
                          }
                        },
                        dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4.0),
                                hintText: hintText,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                        dropdownBuilder:
                            (BuildContext context, T? selectedItem) {
                          return Text(
                            selectedItem != null
                                ? itemLabel(selectedItem)
                                : hintText,
                            style: const TextStyle(color: Colors.black),
                          );
                        },
                        popupProps: PopupProps<T>.menu(
                          fit: FlexFit.loose,
                          // showSearchBox: false,
                          constraints: BoxConstraints(
                              minHeight: dropdownBoxMinHeight,
                              maxHeight: context.height * .6),
                          menuProps:
                              const MenuProps(backgroundColor: Colors.white),
                          showSearchBox: showSearchBox, // Enable the search box
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        )),
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: CustomText(
                        writtenText: state.errorText ?? '',
                        textStyle: ThemeTextStyle.style(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }

  List<TextSpan> _buildLabelTextSpans(
      String labelText, TextStyle labelTextStyle) {
    final List<TextSpan> spans = <TextSpan>[];
    final List<String> parts = labelText.split('*');
    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i], style: labelTextStyle));
      if (i < parts.length - 1) {
        spans.add(TextSpan(
            text: '*', style: labelTextStyle.copyWith(color: Colors.red)));
      }
    }
    return spans;
  }
}

///DATE PICKER WITH LABEL
class CustomDateSelection extends StatelessWidget {
  const CustomDateSelection({
    required this.onValue,
    required this.labelName,
    required this.labelStyle,
    required this.dateLabel,
    required this.lastDate,
    this.iconSize,
    this.iconColor = ThemeColors.blackColor,
    this.iconName = Icons.calendar_month,
    super.key,
  });
  final DateTime dateLabel;
  final IconData iconName;
  final double? iconSize;
  final Color iconColor;
  final FutureOr<DateTime?> Function(DateTime?) onValue;
  final DateTime lastDate;
  final String labelName;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            writtenText: labelName,
            textStyle: labelStyle,
          ),
          8.ph,
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: ThemeColors.greyColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    writtenText: Utils.getStringDateFrmtDMY(dT: dateLabel),
                    textStyle: ThemeTextStyle.style(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        CustomShowDialog.openCalender(
                          context,
                          DateTime.now(),
                          lastDate,
                          DateTime.now(),
                          //  DateTime.now().add(const Duration(days: 30))
                        ).then(onValue);
                      },
                      child: CustomIcon(
                        icon: iconName,
                        size: iconSize ?? 30.0,
                        color: iconColor,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///FILE PICKER WITH LABEL
class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({
    required this.labelName,
    required this.labelStyle,
    required this.fileName,
    required this.onTap,
    this.iconSize,
    this.iconColor = ThemeColors.blackColor,
    this.iconName = Icons.attach_file,
    super.key,
  });
  final String labelName;
  final TextStyle labelStyle;
  final String fileName;
  final IconData iconName;
  final double? iconSize;
  final Color iconColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
            writtenText: labelName,
            textStyle: labelStyle,
          ),
          8.ph,
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: ThemeColors.greyColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    writtenText: fileName,
                    textStyle: ThemeTextStyle.style(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  InkWell(
                      onTap: onTap,
                      child: CustomIcon(
                        icon: iconName,
                        size: iconSize ?? 30.0,
                        color: iconColor,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



///CustomRadioButton
class CustomRadioButton extends StatelessWidget {
  final String label;
  final String? value;
  final String yesOption;
  final String noOption;
  final void Function(String?) onChanged;
  final TextStyle? labelTextStyle;
  final TextStyle? optionTextStyle;

  const CustomRadioButton({
    required this.label,
    required this.value,
    required this.onChanged,
    this.yesOption = 'Yes',
    this.noOption = 'No',
    this.labelTextStyle,
    this.optionTextStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: labelTextStyle ??
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: yesOption,
                  groupValue: value,
                  onChanged: onChanged,
                  title: Text(
                    yesOption,
                    style: optionTextStyle ??
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  value: noOption,
                  groupValue: value,
                  onChanged: onChanged,
                  title: Text(
                    noOption,
                    style: optionTextStyle ??
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}