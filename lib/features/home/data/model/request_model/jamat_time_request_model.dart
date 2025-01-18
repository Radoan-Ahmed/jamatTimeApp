// To parse this JSON data, do
//
//     final jamatTimeRequestModel = jamatTimeRequestModelFromJson(jsonString);

import 'dart:convert';

JamatTimeRequestModel jamatTimeRequestModelFromJson(String str) => JamatTimeRequestModel.fromJson(json.decode(str));

String jamatTimeRequestModelToJson(JamatTimeRequestModel data) => json.encode(data.toJson());

class JamatTimeRequestModel {
    String? mosqueName;
    String? location;

    JamatTimeRequestModel({
        this.mosqueName,
        this.location,
    });

    factory JamatTimeRequestModel.fromJson(Map<String, dynamic> json) => JamatTimeRequestModel(
        mosqueName: json["mosque_name"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "mosque_name": mosqueName,
        "location": location,
    };
}
