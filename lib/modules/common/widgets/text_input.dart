import 'package:exam_prep/const/app_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    this.isRequired = false,
    required this.helpText,
    this.inputType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  final String helpText;
  final bool isRequired;
  final TextInputType inputType;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var isFocused = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          if (!isFocused)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.isRequired ? '*' : '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.helpText,
                  style: const TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          TextFormField(
            keyboardType: widget.inputType,
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  isFocused = true;
                });
              } else {
                setState(() {
                  isFocused = false;
                });
              }
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please fill required input';
              }
              return null;
            },
            onTap: () {
              setState(() {
                isFocused = false;
              });
            },
            cursorColor: CommonColor.lightTextColor,
            cursorWidth: 1,
            cursorHeight: 18,
            enableSuggestions: false,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 26),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              prefixIcon: Text(
                (widget.isRequired && isFocused) ? '*' : '',
                style: const TextStyle(
                    color: CommonColor.errorColor, fontSize: 16),
              ),
              hintText: isFocused ? widget.helpText : '',
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: CommonColor.appBarColor,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: CommonColor.errorColor),
              ),
              contentPadding: const EdgeInsets.only(
                top: 0,
                bottom: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
