import 'package:ecommerce/model/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/model/ui/widgets/custom_form_field.dart';
import 'package:ecommerce/model/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String screeenName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/route_logo.png'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Welcome Back To Route',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Please sign in with your email',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 15),
                      ),
                    ),
                    const FormLabel(formLabel: 'User Name'),
                    const CustomFormField(
                      hintText: 'Enter Your User Name',
                    ),
                    const FormLabel(formLabel: 'Email'),
                    const CustomFormField(hintText: 'Enter Your Email'),
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 15),
                      ),
                    ),
                    CustomElevatedButton(onPressed: () {}, label: 'Log in'),
                    Center(
                      child: Text(
                        "Don't have an account? Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
