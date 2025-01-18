class Rows {
    int? oid;
    String? prayerName;
    String? jamatTime;
    String? mosqueName;
    String? location;

    Rows({
        this.oid,
        this.prayerName,
        this.jamatTime,
        this.mosqueName,
        this.location,
    });

    factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        oid: json["oid"],
        prayerName: json["prayer_name"],
        jamatTime: json["jamat_time"],
        mosqueName: json["mosque_name"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "oid": oid,
        "prayer_name": prayerName,
        "jamat_time": jamatTime,
        "mosque_name": mosqueName,
        "location": location,
    };
}
