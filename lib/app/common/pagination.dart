import 'package:soul_doctor/app/common/pagination_information.dart';

class Pagination<T> {
  T data;
  PaginationInformation paginationData;

  Pagination({required this.data, required this.paginationData});
}
