import 'package:auth_app/components/email_field.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/components/submit_btn.dart';
import 'package:auth_app/components/password_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  bool get isButtonDisabled => !(isEmailValid && isPasswordValid);

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        },
      );

      try {
        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          Navigator.of(context).pop();
          successMessage();
          resetForm();
        }
      } catch (error) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    }
  }

  void successMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Sign up success',
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
      },
    );
  }

  void resetForm() {
    emailController.clear();
    passwordController.clear();
    setState(() {
      isEmailValid = false;
      isPasswordValid = false;
    });
  }

  void onEmailValidationChanged(bool isValid) {
    setState(() {
      isEmailValid = isValid;
    });
  }

  void onPasswordValidationChanged(bool isValid) {
    setState(() {
      isPasswordValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/bg.png"),
            fit: BoxFit.contain,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(244, 249, 255, 1),
              Color(0xFFE0EDFB),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 28,
                      color: Color.fromRGBO(74, 78, 113, 1),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 40),
                  EmailValidator(
                      controller: emailController,
                      onChanged: onEmailValidationChanged),
                  PasswordValidator(
                    controller: passwordController,
                    onChanged: onPasswordValidationChanged,
                  ),
                  const SizedBox(height: 40),
                  SubmitBtn(
                    onSubmit: signUp,
                    textContent: 'Sign up',
                    isDisabled: isButtonDisabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
