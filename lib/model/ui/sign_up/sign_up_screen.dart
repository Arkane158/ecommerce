// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerce/dialoge_utils.dart';
import 'package:ecommerce/model/base/base_state.dart';
import 'package:ecommerce/model/provider/app_config_provider.dart';
import 'package:ecommerce/model/ui/home/home_screen.dart';
import 'package:ecommerce/model/ui/login/login_screen.dart';
import 'package:ecommerce/model/ui/sign_up/signup_navigator.dart';
import 'package:ecommerce/model/ui/sign_up/sign_up_view_model.dart';
import 'package:ecommerce/model/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/model/ui/widgets/custom_form_field.dart';
import 'package:ecommerce/model/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  static const String screenName = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen, SignUpViewModel>
    implements SignUpNavigator {
  @override
  initState() {
    super.initState();
    viewModel.navigator = this;
    viewModel.appConfigProvider = AppConfigProvider();
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.screeenName);
                            },
                            child: Text(
                              "Already Have Account? Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.blue),
                            ),
                          ),
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
      ),
    );
  }

  register() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signUp(
        nameController.text,
        emailController.text,
        passwordConfirmController.text,
        passwordController.text,
        phoneController.text);
  }

  @override
  void hideDialog() {
    DialogeUtils.hideDialog(context);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle}) {
    DialogeUtils.showMessage(context, message);
  }

  @override
  void showProgressDialog(String message, {bool isDismissible = true}) {
    DialogeUtils.showProgressDialog(context, message = message);
  }

  @override
  void navigatHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.screenName);
  }

  @override
  SignUpViewModel initViewmodel() {
    return SignUpViewModel();
  }
}
