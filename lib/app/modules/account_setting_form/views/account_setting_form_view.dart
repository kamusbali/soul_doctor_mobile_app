import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_setting_form_controller.dart';

class AccountSettingFormView extends GetView<AccountSettingFormController> {
  const AccountSettingFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountSettingFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountSettingFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
