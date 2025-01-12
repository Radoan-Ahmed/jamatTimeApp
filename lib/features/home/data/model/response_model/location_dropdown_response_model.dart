// To parse this JSON data, do
//
//     final locationDropdownResponseModel = locationDropdownResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';

LocationDropdownResponseModel locationDropdownResponseModelFromJson(String str) => LocationDropdownResponseModel.fromJson(json.decode(str));

String locationDropdownResponseModelToJson(LocationDropdownResponseModel data) => json.encode(data.toJson());

class LocationDropdownResponseModel {
    int? code;
    bool? status;
    String? message;
    List<Datum>? data;

    LocationDropdownResponseModel({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    factory LocationDropdownResponseModel.fromJson(Map<String, dynamic> json) => LocationDropdownResponseModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

