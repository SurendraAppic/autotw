// To parse this JSON data, do
//
//     final websitmodal = websitmodalFromJson(jsonString);

import 'dart:convert';

List<Websitmodal> websitmodalFromJson(String str) => List<Websitmodal>.from(json.decode(str).map((x) => Websitmodal.fromJson(x)));

String websitmodalToJson(List<Websitmodal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Websitmodal {
    final int hsnId;
    final String hsnCode;
    final int igst;
    final double cgst;
    final double sgst;
    final int status;
    final int locationId;

    Websitmodal({
        required this.hsnId,
        required this.hsnCode,
        required this.igst,
        required this.cgst,
        required this.sgst,
        required this.status,
        required this.locationId,
    });

    factory Websitmodal.fromJson(Map<String, dynamic> json) => Websitmodal(
        hsnId: json["hsn_Id"],
        hsnCode: json["hsn_Code"],
        igst: json["igst"],
        cgst: json["cgst"]?.toDouble(),
        sgst: json["sgst"]?.toDouble(),
        status: json["status"],
        locationId: json["locationId"],
    );

    Map<String, dynamic> toJson() => {
        "hsn_Id": hsnId,
        "hsn_Code": hsnCode,
        "igst": igst,
        "cgst": cgst,
        "sgst": sgst,
        "status": status,
        "locationId": locationId,
    };
}

