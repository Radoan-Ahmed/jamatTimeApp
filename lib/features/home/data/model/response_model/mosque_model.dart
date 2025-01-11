class Datum {
    String? name;
    int? oid;
    String? location;

    Datum({
        this.name,
        this.oid,
        this.location,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
