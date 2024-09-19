// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    final SchoolEvent? schoolEvent;
    final List<dynamic>? eventAttachmentsList;

    NewsModel({
        this.schoolEvent,
        this.eventAttachmentsList,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        schoolEvent: json["schoolEvent"] == null ? null : SchoolEvent.fromJson(json["schoolEvent"]),
        eventAttachmentsList: json["eventAttachmentsList"] == null ? [] : List<dynamic>.from(json["eventAttachmentsList"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "schoolEvent": schoolEvent?.toJson(),
        "eventAttachmentsList": eventAttachmentsList == null ? [] : List<dynamic>.from(eventAttachmentsList!.map((x) => x)),
    };
}

class SchoolEvent {
    final int? eventId;
    final String? schoolId;
    final String? eventType;
    final String? eventName;
    final String? description;
    final DateTime? eventFromDate;
    final DateTime? eventToDate;

    SchoolEvent({
        this.eventId,
        this.schoolId,
        this.eventType,
        this.eventName,
        this.description,
        this.eventFromDate,
        this.eventToDate,
    });

    factory SchoolEvent.fromJson(Map<String, dynamic> json) => SchoolEvent(
        eventId: json["eventId"],
        schoolId: json["schoolId"],
        eventType: json["eventType"],
        eventName: json["eventName"],
        description: json["description"],
        eventFromDate: json["eventFromDate"] == null ? null : DateTime.parse(json["eventFromDate"]),
        eventToDate: json["eventToDate"] == null ? null : DateTime.parse(json["eventToDate"]),
    );

    Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "schoolId": schoolId,
        "eventType": eventType,
        "eventName": eventName,
        "description": description,
        "eventFromDate": "${eventFromDate!.year.toString().padLeft(4, '0')}-${eventFromDate!.month.toString().padLeft(2, '0')}-${eventFromDate!.day.toString().padLeft(2, '0')}",
        "eventToDate": "${eventToDate!.year.toString().padLeft(4, '0')}-${eventToDate!.month.toString().padLeft(2, '0')}-${eventToDate!.day.toString().padLeft(2, '0')}",
    };
}
