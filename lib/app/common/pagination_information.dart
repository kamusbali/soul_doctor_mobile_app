class PaginationInformation {
  int currentPage;
  int totalPage;

  PaginationInformation({required this.currentPage, required this.totalPage});

  factory PaginationInformation.defaultObj() =>
      PaginationInformation(currentPage: -99, totalPage: -99);
}
