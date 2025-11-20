import 'package:soul_doctor/app/domain/model/visitor_rejection.dart';

class VisitScheduleFormSettings {
  String id;
  VisitorRejection? visitorRejection;

  VisitScheduleFormSettings({this.visitorRejection, required this.id});
}
