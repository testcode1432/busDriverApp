class UserLocationForm {
  String? creationTime;
  String? updationTime;
  String? createdBy;
  String? updatedBy;
  String? busRegistrationNumber;
  String? currentLongitude;
  String? currentLatitude;
  String? lastLatitude;
  String? lastLongitude;

  UserLocationForm(
      {this.creationTime,
        this.updationTime,
        this.createdBy,
        this.updatedBy,
        this.busRegistrationNumber,
        this.currentLongitude,
        this.currentLatitude,
        this.lastLatitude,
        this.lastLongitude});

  UserLocationForm.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    updationTime = json['updationTime'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    busRegistrationNumber = json['busRegistrationNumber'];
    currentLongitude = json['currentLongitude'];
    currentLatitude = json['currentLatitude'];
    lastLatitude = json['lastLatitude'];
    lastLongitude = json['lastLongitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationTime'] = this.creationTime;
    data['updationTime'] = this.updationTime;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['busRegistrationNumber'] = this.busRegistrationNumber;
    data['currentLongitude'] = this.currentLongitude;
    data['currentLatitude'] = this.currentLatitude;
    data['lastLatitude'] = this.lastLatitude;
    data['lastLongitude'] = this.lastLongitude;
    return data;
  }
}