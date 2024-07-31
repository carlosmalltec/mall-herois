import 'package:flutter/material.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

class ButtonCustom extends StatelessWidget {
  final EdgeInsets? edgeInsets;
  final BorderRadius? borderRadius;
  final BorderSide borderSide;
  final Color colorBackground;
  final Color disabledTextColor;
  final TextStyle? textStyle;
  final double elevation;
  final double minWidth;
  final double height;
  final Function()? onPressed;
  final Widget child;
  final double? width;
  final bool disabled;
  final bool isLoading;

  const ButtonCustom({
    super.key,
    this.edgeInsets,
    this.borderRadius,
    this.colorBackground = Colors.white,
    this.disabledTextColor = Colors.white,
    this.textStyle,
    this.elevation = 0,
    this.minWidth = 0.0,
    this.height = 48.0,
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    required this.child,
    this.borderSide = BorderSide.none,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            side: borderSide),
        padding: edgeInsets ?? const EdgeInsets.all(20),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: minWidth,
        height: height,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                disabled ? colorBackground.withOpacity(0.3) : colorBackground),
            elevation: WidgetStateProperty.all(elevation),
            textStyle: WidgetStateProperty.all(textStyle),
            side: WidgetStateProperty.all(borderSide),
            foregroundColor: WidgetStateProperty.all(disabledTextColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                side: borderSide)),
          ),
          onPressed: onPressed,
          child: !isLoading
              ? child
              : const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: ConstColors.grayLight,
                    strokeWidth: 1.4,
                  ),
                ),
        ),
      ),
    );
  }
}
