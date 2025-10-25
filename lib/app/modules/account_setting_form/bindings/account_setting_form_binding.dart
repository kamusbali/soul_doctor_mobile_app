import 'package:get/get.dart';

import '../controllers/account_setting_form_controller.dart';

class AccountSettingFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingFormController>(
      () => AccountSettingFormController(),
    );
  }
}
