class UserDataModel {
  final String classTeacherId;
  final String section;
  final String schoolId;
  final String grade;
  final String classId;

  UserDataModel({
    required this.classTeacherId,
    required this.section,
    required this.schoolId,
    required this.grade,
    required this.classId,
  });

  Map<String, dynamic> toJson() {
    return {
      'classTeacherId': classTeacherId,
      'section': section,
      'schoolId': schoolId,
      'grade': grade,
      'classId': classId,
    };
  }
}
