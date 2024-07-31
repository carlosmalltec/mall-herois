import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';

import '../styles/text_styles.dart';

class CustomFormInput extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String labelText;
  final String hintText;
  final String? initialValue;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final bool autofocus;
  final TextInputAction textInputAction;
  final bool enabled;
  final bool obscureText;
  final int passwordWeak;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final String? textIconPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showPasswordText;
  final IconData? icon;
  final Function()? onIconPressed;
  final bool showWeakPassword;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool isFieldSearch;

  const CustomFormInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.onSaved,
    this.labelText = 'título do campo',
    this.hintText = 'sub-titulo',
    this.initialValue,
    this.autofocus = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.passwordWeak = 0,
    this.maxLength = 90,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.onFieldSubmitted,
    this.onIconPressed,
    this.showPasswordText = false,
    this.textIconPassword = "visible",
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.showWeakPassword = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.contentPadding = const EdgeInsets.only(left: 10, bottom: 10, top: 20),
    this.isFieldSearch = false,
  }) : super(key: key);

  @override
  _CustomFormInputState createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomFormInput> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 55.0, maxHeight: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  widget.labelText,
                  style: TextStylesCustom.paragraphMdStrong().copyWith(
                      color: ConstColors.blueStrong, fontSize: 15),
                ),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: TextStylesCustom.paragraphMdRegular().copyWith(
                    color: ConstColors.neutralStronger,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.start,
                validator: widget.validator,
                onChanged: widget.onChanged,
                onSaved: widget.onSaved,
                onFieldSubmitted: widget.onFieldSubmitted,
                onTap: widget.onTap,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                obscureText: widget.obscureText,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  filled: true,
                  counterText: '',
                  errorMaxLines: 3,
                  hintMaxLines: 2,
                  fillColor: widget.isFieldSearch
                      ? Colors.transparent
                      : (widget.enabled
                          ? Colors.transparent
                          : ConstColors.grayLight.withOpacity(0.4)),
                  contentPadding: widget.contentPadding,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hintText,
                  hintStyle: TextStylesCustom.paragraphMdRegular().copyWith(
                    height: 2.8,
                    color: ConstColors.neutralStronger,
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                  errorStyle: TextStylesCustom.paragraphMdRegular().copyWith(
                      color: ConstColors.redStronger,
                      fontSize: 12,
                      height: 1.2),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 2, color: ConstColors.blueStrong),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1, color: ConstColors.neutralStronger),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1, color: ConstColors.neutralStronger),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 1, color: ConstColors.neutralStronger),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1, color: ConstColors.redStronger),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 2, color: ConstColors.redStronger),
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
