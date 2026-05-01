class UpdateCourseRequest {
  final int? id;
  final String? name;
  final String? doctorName;
  final String? academicYear;
  final List<String>? departments;

  UpdateCourseRequest({
    this.id,
    this.name,
    this.doctorName,
    this.academicYear,
    this.departments,
  });
}
