// To parse this JSON data, do
//
//     final jamatTimeResponseModel = jamatTimeResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:jamat_app/features/home/data/model/response_model/jamat_time_model.dart';

JamatTimeResponseModel jamatTimeResponseModelFromJson(String str) => JamatTimeResponseModel.fromJson(json.decode(str));

String jamatTimeResponseModelToJson(JamatTimeResponseModel data) => json.encode(data.toJson());

class JamatTimeResponseModel {
    int? code;
    bool? status;
    String? message;
    Data? data;

    JamatTimeResponseModel({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    factory JamatTimeResponseModel.fromJson(Map<String, dynamic> json) => JamatTimeResponseModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? total;
    List<Rows>? rows;

    Data({
        this.total,
        this.rows,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        rows: json["rows"] == null ? [] : List<Rows>.from(json["rows"]!.map((x) => Rows.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x.toJson())),
    };
}

