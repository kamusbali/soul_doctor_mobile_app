import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_history_controller.dart';

class DoctorHistoryView extends GetView<DoctorHistoryController> {
  const DoctorHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctorHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoctorHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
