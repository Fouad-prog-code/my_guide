class UpdateStudentRequest {
  final int? id;
  final String? nationalId;
  final String? fullName;
  final String? userName;
  final String? academicYear;
  final String? department;

  UpdateStudentRequest({
    this.id,
    this.nationalId,
    this.fullName,
    this.userName,
    this.academicYear,
    this.department,
  });
}
