import 'package:ecommerce/model/api/api_manager.dart';
import 'package:ecommerce/model/base/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  void forgotPassword( String email) async {
    navigator?.showProgressDialog('loading...');
    try {
      var response = await ApiManager.forgotPassword(email);

      navigator?.hideDialog();
      navigator?.showMessage(response.message.toString(), posActionTitle: 'Ok');
    } catch (e) {
      navigator?.hideDialog();
      navigator?.showMessage(e.toString(), posActionTitle: 'Ok');
    }
  }
}
