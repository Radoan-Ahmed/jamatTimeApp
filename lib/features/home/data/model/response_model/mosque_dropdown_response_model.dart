// To parse this JSON data, do
//
//     final mosqueDropdownResponseModel = mosqueDropdownResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';

MosqueDropdownResponseModel mosqueDropdownResponseModelFromJson(String str) => MosqueDropdownResponseModel.fromJson(json.decode(str));

String mosqueDropdownResponseModelToJson(MosqueDropdownResponseModel data) => json.encode(data.toJson());

class MosqueDropdownResponseModel {
    int? code;
    bool? status;
    String? message;
    List<Datum>? data;

    MosqueDropdownResponseModel({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    factory MosqueDropdownResponseModel.fromJson(Map<String, dynamic> json) => MosqueDropdownResponseModel(
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
