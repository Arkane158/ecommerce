import 'package:ecommerce/model/base/base_view_model.dart';
import 'package:ecommerce/model/provider/app_config_provider.dart';
import 'package:ecommerce/model/ui/sign_up/signup_navigator.dart';
import '../../api/api_manager.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator> {
  AppConfigProvider? appConfigProvider;

  signUp(String name, String email, String password,
      String passwordConfirmation, String phone) async {
    navigator?.showProgressDialog('loading...');
    try {
      var response = await ApiManager.register(
          name, email, password, passwordConfirmation, phone);
      navigator?.hideDialog();
      if (response.errors != null) {
        navigator?.showMessage(response.mergeErrors(), posActionTitle: 'ok');
        return;
      }
      navigator?.showMessage('SignUp successfully', posActionTitle: 'ok');
      appConfigProvider?.setToken(response.token);
      navigator?.navigatHome();
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage(
        'Error ${e.toString()}',
      );
    }
  }
}
