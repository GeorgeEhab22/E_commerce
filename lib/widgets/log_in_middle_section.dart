import 'package:e_commerce/api/firebase_helper.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widgets/custom_auth_text_form_field.dart';
import 'package:flutter/material.dart';

class LogInMiddleSection extends StatefulWidget {
  const LogInMiddleSection({super.key});

  @override
  State<LogInMiddleSection> createState() => _LogInMiddleSectionState();
}

class _LogInMiddleSectionState extends State<LogInMiddleSection> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String password = '';
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAuthTextFormField(
                onChanged: (value) {
                  email = value;
                },
                hint: 'Your Email',
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else {
                    return null;
                  }
                },
                prefix: const Icon(
                  Icons.mail,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              CustomAuthTextFormField(
                onChanged: (value) {
                  password = value;
                },
                hint: 'Your Password',
                label: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
                obsecureText: !flag,
                prefix: const Icon(
                  Icons.lock_outline,
                  color: primaryColor,
                ),
                suffix: (flag)
                    ? GestureDetector(
                        onTap: () {
                          flag = !flag;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.visibility,
                          color: primaryColor,
                        ))
                    : GestureDetector(
                        onTap: () {
                          flag = !flag;
                          setState(() {});
                        },
                        child: const Icon(Icons.visibility_off,
                            color: Colors.grey),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                await FireBaseHelper().signIn(
                  email: email,
                  password: password,
                );
                autovalidateMode = AutovalidateMode.disabled;
                setState(() {});
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF40BFFF),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
