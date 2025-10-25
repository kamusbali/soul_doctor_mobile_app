import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return super.redirect(route);
  }
}
