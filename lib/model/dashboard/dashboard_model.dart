
class DashBoradModel {
  String? firstName;
  String? middleName;
  String? lastName;
  String? phoneNo;
  String? schoolId;
  String? schoolName;
  String? photoUrl;
  String? userType;
  String? branchName;
//  Student? student;

  DashBoradModel(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.phoneNo,
      this.schoolId,
      this.schoolName,
      this.photoUrl,
      this.userType,
        this.branchName
      //this.student
      });

  DashBoradModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    phoneNo = json['phoneNo'];
    schoolId = json['schoolId'];
    schoolName = json['schoolName'];
    photoUrl = json['photoUrl'] ?? '';
    userType = json['userType'];
    branchName = json['branchName'];
    // student = json['studentBasicInfo'] != null
    //     ? new Student.fromJson(json['studentBasicInfo'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['phoneNo'] = this.phoneNo;
    data['schoolId'] = this.schoolId;
    data['schoolName'] = this.schoolName;
    data['photoUrl'] = this.photoUrl;
    data['userType'] = this.userType;
    data['branchName'] = this.branchName;
    // if (this.student != null) {
    //   data['studentBasicInfo'] = this.student!.toJson();
    // }
    return data;
  }
}

// class Student {
//   String? grade;
//   String? section;
//   String? rollNumber;
//   String? classTeacherId;
//   String? classTeacherName;
//   String? schoolContact;
//   String? busNumber;
//
//   Student(
//       {this.grade,
//       this.section,
//       this.rollNumber,
//       this.classTeacherId,
//       this.classTeacherName,
//       this.schoolContact,
//       this.busNumber});
//
//   Student.fromJson(Map<String, dynamic> json) {
//     grade = json['grade'] ?? '-';
//     section = json['section'] ?? '-';
//     rollNumber = json['rollNumber'] ?? '-';
//     classTeacherId = json['classTeacherId'] ?? '-';
//     classTeacherName = json['classTeacherName'] ?? '-';
//     schoolContact = json['schoolContact'] ?? '-';
//     busNumber = json['busNumber'] ?? '-';
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['grade'] = this.grade;
//     data['section'] = this.section;
//     data['rollNumber'] = this.rollNumber;
//     data['classTeacherId'] = this.classTeacherId;
//     data['classTeacherName'] = this.classTeacherName;
//     data['schoolContact'] = this.schoolContact;
//     data['busNumber'] = this.busNumber;
//     return data;
//   }
// }
