class UserInfoModal {
  final String userName;
  final String token;
  final String refreshToken;
  // final String? userId;
  // final String? classTeacherId;
  // final String? section;
  // final String? schoolId;
  // final String? grade;
  // final String? classId;

  UserInfoModal({
    required this.userName,
    required this.token,
    required this.refreshToken,
    // this.userId,
    // this.classTeacherId,
    // this.section,
    // this.schoolId,
    // this.grade,
    // this.classId,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'token': token,
      'refreshToken': refreshToken,
      // 'userId': userId,
      // 'classTeacherId': classTeacherId,
      // 'section': section,
      // 'schoolId': schoolId,
      // 'grade': grade,
      // 'classId': classId,
    };
  }
}
