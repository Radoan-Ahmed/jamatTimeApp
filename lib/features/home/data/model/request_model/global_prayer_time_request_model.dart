// To parse this JSON data, do
//
//     final globalPrayerTimeRequestModel = globalPrayerTimeRequestModelFromJson(jsonString);

import 'dart:convert';

GlobalPrayerTimeRequestModel globalPrayerTimeRequestModelFromJson(String str) => GlobalPrayerTimeRequestModel.fromJson(json.decode(str));

String globalPrayerTimeRequestModelToJson(GlobalPrayerTimeRequestModel data) => json.encode(data.toJson());

class GlobalPrayerTimeRequestModel {
    String? location;

    GlobalPrayerTimeRequestModel({
        this.location,
    });

    factory GlobalPrayerTimeRequestModel.fromJson(Map<String, dynamic> json) => GlobalPrayerTimeRequestModel(
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
    };
}
