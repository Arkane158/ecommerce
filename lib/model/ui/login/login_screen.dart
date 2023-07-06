import 'package:ecommerce/model/api/api_manager.dart';
import 'package:ecommerce/model/ui/dialoge_utils.dart';
import 'package:ecommerce/model/ui/sign_up/sign_up_screen.dart';
import 'package:ecommerce/model/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/model/ui/widgets/custom_form_field.dart';
import 'package:ecommerce/model/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String screeenName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                child: Form(
                  key: formKey,
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
                      const FormLabel(formLabel: 'Email'),
                      CustomFormField(
                        hintText: 'Enter Your Email',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                      const FormLabel(formLabel: 'Password'),
                      CustomFormField(
                        hintText: 'Enter Your Password',
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        hideText: true,
                      ),
                      Center(
                        child: Text(
                          'Forgot Password',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 15),
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => {
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.screenName)
                          },
                          child: Text(
                            "Don't have an account? Create Account",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 15, color: Colors.blue),
                          ),
                        ),
                      ),
                      CustomElevatedButton(
                          onPressed: () {
                            signIn();
                          },
                          label: 'Log in'),
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

  signIn() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    DialogeUtils.showMessage(context, 'Loading...');
    var response =
        await ApiManager.login(emailController.text, passwordController.text);
    DialogeUtils.showMessage(context, '${response.token}');
  }
}
