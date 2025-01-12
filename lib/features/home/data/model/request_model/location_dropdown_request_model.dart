// To parse this JSON data, do
//
//     final locationDropdownRequestModel = locationDropdownRequestModelFromJson(jsonString);

import 'dart:convert';

LocationDropdownRequestModel locationDropdownRequestModelFromJson(String str) => LocationDropdownRequestModel.fromJson(json.decode(str));

String locationDropdownRequestModelToJson(LocationDropdownRequestModel data) => json.encode(data.toJson());

class LocationDropdownRequestModel {
    String? name;
    int? oid;
    String? location;

    LocationDropdownRequestModel({
        this.name,
        this.oid,
        this.location,
    });

    factory LocationDropdownRequestModel.fromJson(Map<String, dynamic> json) => LocationDropdownRequestModel(
        name: json["name"],
        oid: json["oid"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "oid": oid,
        "location": location,
    };
}
