// To parse this JSON data, do
//
//     final goruppartmodel = goruppartmodelFromJson(jsonString);

import 'dart:convert';

List<Goruppartmodel> goruppartmodelFromJson(String str) => List<Goruppartmodel>.from(json.decode(str).map((x) => Goruppartmodel.fromJson(x)));

String goruppartmodelToJson(List<Goruppartmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Goruppartmodel {
    final int id;
    final String name;
    final int locationId;
    final int miscMasterId;

    Goruppartmodel({
        required this.id,
        required this.name,
        required this.locationId,
        required this.miscMasterId,
    });

    factory Goruppartmodel.fromJson(Map<String, dynamic> json) => Goruppartmodel(
        id: json["id"],
        name: json["name"],
        locationId: json["locationId"],
        miscMasterId: json["miscMasterId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locationId": locationId,
        "miscMasterId": miscMasterId,
    };
}
