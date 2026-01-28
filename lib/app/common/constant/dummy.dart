import 'dart:math';

import 'package:soul_doctor/app/common/constant/const_path.dart';

abstract class Dummy {
  static String photoProfile() =>
      "${ConstPath.AVATAR_DEFAULT_PATH}/${Random().nextInt(20) + 1}.png";
}
