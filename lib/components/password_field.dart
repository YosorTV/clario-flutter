import 'package:flutter/material.dart';

class PasswordValidator extends StatefulWidget {
  final void Function(bool) onChanged;
  final TextEditingController controller;

  const PasswordValidator({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  State<PasswordValidator> createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  bool isPasswordValid = false;
  bool obscureText = true;

  bool validatePassword(String value) {
    return value.length >= 8 &&
        value.length <= 64 &&
        value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'[0-9]'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPasswordTextField(),
        const SizedBox(height: 20),
        _buildValidationMessages(),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        onChanged: (value) {
          setState(() {
            isPasswordValid = validatePassword(value);
            widget.onChanged(isPasswordValid);
          });
        },
        decoration: InputDecoration(
          hintText: 'Create your password',
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildValidationMessages() {
    return Column(
      children: [
        _buildValidationMessage(
          '8 characters or more (no spaces)',
          widget.controller.text.length >= 8 &&
              widget.controller.text.length <= 64,
        ),
        _buildValidationMessage(
          'Uppercase and lowercase letters',
          widget.controller.text.contains(RegExp(r'[A-Z]')),
        ),
        _buildValidationMessage(
          'At least one digit',
          widget.controller.text.contains(RegExp(r'[0-9]')),
        ),
      ],
    );
  }

  Widget _buildValidationMessage(String message, bool isValid) {
    Color messageColor = const Color.fromRGBO(74, 78, 113, 1);

    if (widget.controller.text.isNotEmpty) {
      messageColor = isValid ? Colors.green : Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        message,
        style: TextStyle(color: messageColor),
      ),
    );
  }
}
