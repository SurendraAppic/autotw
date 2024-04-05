// To parse this JSON data, do
//
//     final dateVisemodel = dateVisemodelFromJson(jsonString);

import 'dart:convert';

List<DateVisemodel> dateVisemodelFromJson(String str) => List<DateVisemodel>.from(json.decode(str).map((x) => DateVisemodel.fromJson(x)));

String dateVisemodelToJson(List<DateVisemodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DateVisemodel {
    final int prospectId;
    final SalesPerson salesPerson;
    final int refNo;
    final String priority;
    final String customerName;
    final String mobNo;
    final String phonNo;
    final Product product;
    final RefDate refDate;
    final String remarkSpecial;
    final String lastContactDate;
    final LastRemark lastRemark;
    final String lastActionTaken;
    final String currentAppointmentDate;
    final String enquiryStatus;

    DateVisemodel({
        required this.prospectId,
        required this.salesPerson,
        required this.refNo,
        required this.priority,
        required this.customerName,
        required this.mobNo,
        required this.phonNo,
        required this.product,
        required this.refDate,
        required this.remarkSpecial,
        required this.lastContactDate,
        required this.lastRemark,
        required this.lastActionTaken,
        required this.currentAppointmentDate,
        required this.enquiryStatus,
    });

    factory DateVisemodel.fromJson(Map<String, dynamic> json) => DateVisemodel(
        prospectId: json["prospectId"],
        salesPerson: salesPersonValues.map[json["salesPerson"]]!,
        refNo: json["ref_No"],
        priority: json["priority"],
        customerName: json["customer_Name"],
        mobNo: json["mob_No"],
        phonNo: json["phon_No"],
        product: productValues.map[json["product"]]!,
        refDate: refDateValues.map[json["ref_Date"]]!,
        remarkSpecial: json["remark_Special"],
        lastContactDate: json["lastContact_Date"],
        lastRemark: lastRemarkValues.map[json["last_Remark"]]!,
        lastActionTaken: json["last_ActionTaken"],
        currentAppointmentDate: json["currentAppointmentDate"],
        enquiryStatus: json["enquiryStatus"],
    );

    Map<String, dynamic> toJson() => {
        "prospectId": prospectId,
        "salesPerson": salesPersonValues.reverse[salesPerson],
        "ref_No": refNo,
        "priority": priority,
        "customer_Name": customerName,
        "mob_No": mobNo,
        "phon_No": phonNo,
        "product": productValues.reverse[product],
        "ref_Date": refDateValues.reverse[refDate],
        "remark_Special": remarkSpecial,
        "lastContact_Date": lastContactDate,
        "last_Remark": lastRemarkValues.reverse[lastRemark],
        "last_ActionTaken": lastActionTaken,
        "currentAppointmentDate": currentAppointmentDate,
        "enquiryStatus": enquiryStatus,
    };
}

enum LastRemark {
    JAIPUR
}

final lastRemarkValues = EnumValues({
    "jaipur": LastRemark.JAIPUR
});

enum Product {
    AUTO_WHEEL,
    CCGGGGG,
    CFF,
    MUE_PETRO
}

final productValues = EnumValues({
    "AutoWheel": Product.AUTO_WHEEL,
    "Ccggggg": Product.CCGGGGG,
    "Cff": Product.CFF,
    "MuePetro": Product.MUE_PETRO
});

enum RefDate {
    EMPTY,
    THE_12012024,
    THE_13012024,
    THE_16012024,
    THE_17012024
}

final refDateValues = EnumValues({
    "": RefDate.EMPTY,
    "12-01-2024": RefDate.THE_12012024,
    "13-01-2024": RefDate.THE_13012024,
    "16-01-2024": RefDate.THE_16012024,
    "17-01-2024": RefDate.THE_17012024
});

enum SalesPerson {
    STAFF1,
    STAFF2
}

final salesPersonValues = EnumValues({
    "Staff1": SalesPerson.STAFF1,
    "Staff2": SalesPerson.STAFF2
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
