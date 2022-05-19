import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextFieldPassword({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldPasswordState createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
        Text(
          widget.title,
          style: mainSemibooextStyle.copyWith(
            fontSize: 16
          )
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: _obscureText,
          keyboardType: TextInputType.text,
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
            suffixIcon: IconButton(
              color: kGrey,
              onPressed: _toggle,
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kGrey,
              ),
              borderRadius: BorderRadius.circular(12.0),
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
