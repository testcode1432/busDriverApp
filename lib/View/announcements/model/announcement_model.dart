class AnnouncementModel {
  String? schoolId;
  int? announcementId;
  String? announcementText;
  String? creationTimestamp;
  String? eventDate;

  AnnouncementModel(
      {this.schoolId,
      this.announcementId,
      this.announcementText,
      this.creationTimestamp,
      this.eventDate});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    schoolId = json['schoolId'];
    announcementId = json['announcementId'];
    announcementText = json['announcementText'] ?? 'no description given';
    creationTimestamp = json['creationTimestamp'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolId'] = schoolId;
    data['announcementId'] = announcementId;
    data['announcementText'] = announcementText;
    data['creationTimestamp'] = creationTimestamp;
    data['eventDate'] = eventDate;
    return data;
  }
}
