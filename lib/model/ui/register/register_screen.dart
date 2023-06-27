// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerce/model/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/model/ui/widgets/custom_form_field.dart';
import 'package:ecommerce/model/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  static const String screenName = "RegisterScreen";
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/route_logo.png'),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const FormLabel(formLabel: 'Full Name'),
                      CustomFormField(
                        hintText: 'Enter Your Full Name',
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Full Name is required';
                          }
                        },
                        type: TextInputType.name,
                      ),
                      const FormLabel(
                        formLabel: 'Email',
                      ),
                      CustomFormField(
                        hintText: 'Enter Your Email',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Email is required';
                          }
                        },
                      ),
                      const FormLabel(formLabel: 'Phone Number'),
                      CustomFormField(
                        hintText: 'Enter Your Phone Number',
                        controller: phoneController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Phone Number is required';
                          }
                        },
                        type: TextInputType.phone,
                      ),
                      const FormLabel(
                        formLabel: 'Password',
                      ),
                      CustomFormField(
                        hintText: 'Enter Your Password',
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Password is required';
                          }
                        },
                        hideText: true,
                      ),
                      const FormLabel(formLabel: 'Confirm Password'),
                      CustomFormField(
                        hintText: 'Enter Your Confirm Password',
                        controller: passwordConfirmController,
                        validator: (text) {
                          if (text == null ||
                              text.trim().isEmpty ||
                              passwordController.text != text) {
                            return 'Password Not Matched';
                          }
                        },
                        hideText: true,
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            register();
                          },
                          label: "Sign Up")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  register() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
