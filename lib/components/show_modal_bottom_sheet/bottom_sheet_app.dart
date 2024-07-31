import 'package:flutter/material.dart';

import 'button_close.dart';
import 'line_slider.dart';

enum BottomSheetType { success, warning, error }

abstract class BottomSheetApp {
  static void customBottomSheet({
    required BuildContext context,
    required Widget content,
    bool enableDrag = true,
    bool isDismissible = true,
    bool visibleSlider = false,
    bool visibleButtonClose = true,
  }) =>
      showModalBottomSheet(
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Visibility(
                visible: visibleButtonClose,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: ButtonClose(),
                ),
              ),
              Visibility(
                visible: visibleSlider,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: LineSlider(),
                ),
              ),
              content,
            ],
          ),
        ),
      );
}
