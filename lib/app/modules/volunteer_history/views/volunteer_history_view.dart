import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/volunteer_history_controller.dart';

class VolunteerHistoryView extends GetView<VolunteerHistoryController> {
  const VolunteerHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VolunteerHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VolunteerHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
