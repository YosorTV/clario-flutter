import 'package:flutter/material.dart';

class EmailValidator extends StatefulWidget {
  final void Function(bool) onChanged;
  final TextEditingController controller;

  const EmailValidator({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<EmailValidator> createState() => _EmailValidatorState();
}

class _EmailValidatorState extends State<EmailValidator> {
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailTextField(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            setState(() {
              isEmailValid = _validateEmail(value);
              widget.onChanged(isEmailValid);
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: setColor()),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: setColor()),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          style: TextStyle(color: setColor())),
    );
  }

  bool _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  Color setColor() {
    if (widget.controller.text.isEmpty) {
      return Colors.grey;
    }
    return isEmailValid ? Colors.green : Colors.red;
  }
}
