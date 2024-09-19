class SchoolFeatures {
  String? schoolId;
  String? featureName;
  String? userRole;
  bool? enabled;

  SchoolFeatures(this.schoolId, this.featureName, this.userRole, this.enabled);

  SchoolFeatures.fromJson(Map<String, dynamic> json) {
    schoolId = json['schoolId'];
    featureName = json['featureName'];
    userRole = json['userRole'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['schoolId'] = schoolId;
    data['featureName'] = featureName;
    data['userRole'] = userRole;
    data['enabled'] = enabled;
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}
