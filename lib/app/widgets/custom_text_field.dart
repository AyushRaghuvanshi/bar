import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  const CustomTextField(
      {super.key, required this.controller, this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (val) {
          if (val?.isEmpty ?? true) {
            return 'This Value Can\'t be Empty';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
        ],
        decoration: InputDecoration(
          label: label != null
              ? Text(
                  label!,
                )
              : null,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              22,
            ),
          ),
        ),
      ),
    );
  }
}
