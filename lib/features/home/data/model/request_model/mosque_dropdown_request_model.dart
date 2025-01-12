// To parse this JSON data, do
//
//     final mosqueDropdownRequestModel = mosqueDropdownRequestModelFromJson(jsonString);

import 'dart:convert';

MosqueDropdownRequestModel mosqueDropdownRequestModelFromJson(String str) => MosqueDropdownRequestModel.fromJson(json.decode(str));

String mosqueDropdownRequestModelToJson(MosqueDropdownRequestModel data) => json.encode(data.toJson());

class MosqueDropdownRequestModel {
    int? oid;

    MosqueDropdownRequestModel({
        this.oid,
    });

    factory MosqueDropdownRequestModel.fromJson(Map<String, dynamic> json) => MosqueDropdownRequestModel(
        oid: json["oid"],
    );

    Map<String, dynamic> toJson() => {
        "oid": oid,
    };
}
