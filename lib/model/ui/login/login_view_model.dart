import 'package:ecommerce/model/api/api_manager.dart';
import 'package:ecommerce/model/base/base_view_model.dart';
import 'package:ecommerce/model/provider/app_config_provider.dart';
import 'package:ecommerce/model/ui/login/login_navigator.dart';

class LoginViewModel extends BaseViewModel <LoginNavigator>{
  AppConfigProvider? appConfigProvider;
  void login(String email, String passowrd) async {
    navigator?.showProgressDialog('Loading...');
    try {
      var response = await ApiManager.login(email, passowrd);
      navigator?.hideDialog();
      if (response.message != null) {
        navigator?.showMessage(response.message ?? '', posActionTitle: 'Ok');
        return;
      }
      navigator?.showMessage('login successfully', posActionTitle: 'Ok');
      appConfigProvider?.setToken(response.token);
      navigator?.navigatHome();
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage("Error$e");
    }
  }
}
