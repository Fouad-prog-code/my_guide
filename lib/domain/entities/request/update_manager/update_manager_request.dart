class UpdateManagerRequest {
  final int managerId;
  final String fullName;
  final String userName;
  final String nationalId;

  UpdateManagerRequest({
    required this.managerId,
    required this.fullName,
    required this.userName,
    required this.nationalId,
  });
}
