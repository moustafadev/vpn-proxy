import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final MaskTextInputFormatter? inputFormatter;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.inputFormatter, required this.hintText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = kBlackLight;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = kYellowDark;
        });
      } else {
        setState(() {
          _color = kBlackLight;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: mainSemibooextStyle.copyWith(fontSize: 16)),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: widget.controller,
          scrollPadding: EdgeInsets.zero,
          focusNode: _textFieldFocus,
          cursorColor: kWhite,

          style: const TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: widget.hintText,
            hintStyle: mainRegulartStyle.copyWith(color: kMainGrey),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kGrey,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kYellow,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusColor: kYellowDark,
            filled: true,
            fillColor: _color,
          ),
        ),
      ],
    );
  }
}
