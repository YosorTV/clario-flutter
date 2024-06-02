import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final Function()? onSubmit;
  final String textContent;
  final bool isDisabled;

  const SubmitBtn(
      {super.key,
      required this.isDisabled,
      required this.onSubmit,
      required this.textContent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onSubmit,
      child: Container(
        margin: const EdgeInsets.only(left: 50, right: 50),
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(112, 195, 255, 1),
              Color.fromRGBO(75, 101, 255, 1),
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            textContent,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
