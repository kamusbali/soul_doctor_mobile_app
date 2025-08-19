import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/volunteer_home_controller.dart';

class VolunteerHomeView extends GetView<VolunteerHomeController> {
  const VolunteerHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VolunteerHomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VolunteerHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
