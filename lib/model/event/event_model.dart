class EventModel {
  int? eventId;
  String? schoolId;
  String? eventType;
  String? eventName;
  String? description;
  String? eventFromDate;
  String? eventToDate;

  EventModel(
      {this.eventId,
      this.schoolId,
      this.eventType,
      this.eventName,
      this.description,
      this.eventFromDate,
      this.eventToDate});

  EventModel.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    schoolId = json['schoolId'];
    eventType = json['eventType'];
    eventName = json['eventName'];
    description = json['description'];
    eventFromDate = json['eventFromDate'];
    eventToDate = json['eventToDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eventId'] = eventId;
    data['schoolId'] = schoolId;
    data['eventType'] = eventType;
    data['eventName'] = eventName;
    data['description'] = description;
    data['eventFromDate'] = eventFromDate;
    data['eventToDate'] = eventToDate;
    return data;
  }
}
