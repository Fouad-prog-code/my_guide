import 'package:flutter/material.dart';
import 'package:my_guide/core/utils/validators.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.controller});

  final TextEditingController controller;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !isVisible,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            isVisible = !isVisible;
            setState(() {});
          },
          icon: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        ),
      ),

      validator: (value) =>
          AppValidators.validateRegisterPassword(password: value),
    );
  }
}
