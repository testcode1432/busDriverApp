class SubjectModel {
  String? subjectName;
  String? classId;
  String? teacherUserId;
  String? teacherName;

  SubjectModel(
      {this.subjectName, this.classId, this.teacherUserId, this.teacherName});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    teacherName = json['teacherName'];
    classId = json['classId'];
    teacherUserId = json['teacherUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectName'] = subjectName;
    data['classId'] = classId;
    data['teacherName'] = teacherName;
    data['teacherUserId'] = teacherUserId;
    return data;
  }
}
