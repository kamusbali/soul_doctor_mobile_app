import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_home_controller.dart';

class DoctorHomeView extends GetView<DoctorHomeController> {
  const DoctorHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctorHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoctorHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
