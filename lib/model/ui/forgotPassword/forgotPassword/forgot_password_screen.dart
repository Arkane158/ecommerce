import 'package:ecommerce/model/base/base_state.dart';
import 'package:ecommerce/model/ui/forgotPassword/forgotPassword/forgot_password_navigator.dart';
import 'package:ecommerce/model/ui/forgotPassword/forgotPassword/forgot_password_viewmodel.dart';
import 'package:ecommerce/model/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/model/ui/widgets/custom_form_field.dart';
import 'package:ecommerce/model/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String screenName = 'forgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends BaseState<ForgotPasswordScreen, ForgotPasswordViewModel>
    implements ForgotPasswordNavigator {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

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
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FormLabel(formLabel: 'Email'),
                  CustomFormField(
                    hintText: 'Enter your Email ',
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                      onPressed: forgotPassword, label: 'Sumbit')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  forgotPassword() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.forgotPassword(emailController.text);
  }

  @override
  ForgotPasswordViewModel initViewmodel() {
    return ForgotPasswordViewModel();
  }
}
