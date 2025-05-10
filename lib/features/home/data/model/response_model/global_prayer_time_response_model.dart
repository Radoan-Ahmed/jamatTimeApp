// To parse this JSON data, do
//
//     final globalPrayerTimeResponseModel = globalPrayerTimeResponseModelFromJson(jsonString);

import 'dart:convert';

GlobalPrayerTimeResponseModel globalPrayerTimeResponseModelFromJson(String str) => GlobalPrayerTimeResponseModel.fromJson(json.decode(str));

String globalPrayerTimeResponseModelToJson(GlobalPrayerTimeResponseModel data) => json.encode(data.toJson());

class GlobalPrayerTimeResponseModel {
    int? code;
    bool? status;
    String? message;
    Data? data;

    GlobalPrayerTimeResponseModel({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    factory GlobalPrayerTimeResponseModel.fromJson(Map<String, dynamic> json) => GlobalPrayerTimeResponseModel(
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
    String? location;
    String? date;
    Times? times;

    Data({
        this.location,
        this.date,
        this.times,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        location: json["location"],
        date: json["date"],
        times: json["times"] == null ? null : Times.fromJson(json["times"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "date": date,
        "times": times?.toJson(),
    };
}

class Times {
    String? fajr;
    String? sunrise;
    String? dhuhr;
    String? asr;
    String? maghrib;
    String? isha;

    Times({
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.isha,
    });

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
    );

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Isha": isha,
    };
}
