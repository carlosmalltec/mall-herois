import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

import '../input/custom_input.dart';
import '../show_modal_bottom_sheet/bottom_sheet_app.dart';

class DropdownFieldBottomSheet extends StatelessWidget {
  final TextEditingController? controllerEC;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final bool? blockedOnTab;
  final Widget contentModal;
  final bool enableDrag;
  final bool isDismissible;
  final bool visibleSlider;
  final bool visibleButtonClose;

  const DropdownFieldBottomSheet({
    super.key,
    this.blockedOnTab = false,
    this.controllerEC,
    this.validator,
    required this.labelText,
    required this.hintText,
    required this.contentModal,
    this.enableDrag = true,
    this.isDismissible = true,
    this.visibleButtonClose = true,
    this.visibleSlider = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: blockedOnTab == true
          ? null
          : () => BottomSheetApp.customBottomSheet(
                context: context,
                content: contentModal,
                enableDrag: enableDrag,
                isDismissible: isDismissible,
                visibleButtonClose: visibleButtonClose,
                visibleSlider: visibleSlider,
              ),
      child: CustomFormInput(
        controller: controllerEC,
        labelText: labelText,
        hintText: hintText,
        maxLength: 150,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        enabled: false,
        isFieldSearch: true,
        suffixIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: ConstColors.neutralStronger,
          size: 24,
        ),
        validator: validator,
      ),
    );
  }
}
