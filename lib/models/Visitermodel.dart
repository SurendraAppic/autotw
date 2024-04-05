// To parse this JSON data, do
//
//     final visitermodel = visitermodelFromJson(jsonString);

import 'dart:convert';

List<Visitermodel> visitermodelFromJson(String str) => List<Visitermodel>.from(json.decode(str).map((x) => Visitermodel.fromJson(x)));

String visitermodelToJson(List<Visitermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Visitermodel {
    final int id;
    final int locationId;
    final PrefixName prefixName;
    final int refNo;
    final RefDate refDate;
    final String refTime;
    final int titleId;
    final GenderName genderName;
    final String customerName;
    final ContactName contactName;
    final String sanOffName;
    final String addressDetails;
    final dynamic address2;
    final String cityId;
    final City city;
    final String pinCode;
    final String mobNo;
    final String phonNo;
    final String stdCode;
    final FaxNo faxNo;
    final String emailId;
    final String birthdayDate;
    final AnniversaryDate anniversaryDate;
    final int enqType;
    final String modeType;
    final int occupation;
    final String income;
    final int enqGenById;
    final int salesExId;
    final int sourceId;
    final NoOfVisitor noOfVisitor;
    final String scheme;
    final int priority;
    final String interestIn;
    final int modelId;
    final int colourId;
    final String remarkInterest;
    final int modelTestId;
    final String modelTestDate;
    final String remarkModelTest;
    final String appointmentDate;
    final AppointmentTime appointmentTime;
    final String remarkAppointment;
    final String remarkSpecial;
    final String lastContactDate;
    final City lastRemark;
    final dynamic lastActionTaken;
    final String currentAppointmentDate;
    final int enquiryStatus;
    final dynamic reason;
    final dynamic vehiclePurchase;
    final dynamic booking;
    final dynamic a;
    final dynamic b;
    final dynamic c;
    final dynamic d;
    final dynamic e;
    final dynamic f;
    final dynamic g;

    Visitermodel({
        required this.id,
        required this.locationId,
        required this.prefixName,
        required this.refNo,
        required this.refDate,
        required this.refTime,
        required this.titleId,
        required this.genderName,
        required this.customerName,
        required this.contactName,
        required this.sanOffName,
        required this.addressDetails,
        required this.address2,
        required this.cityId,
        required this.city,
        required this.pinCode,
        required this.mobNo,
        required this.phonNo,
        required this.stdCode,
        required this.faxNo,
        required this.emailId,
        required this.birthdayDate,
        required this.anniversaryDate,
        required this.enqType,
        required this.modeType,
        required this.occupation,
        required this.income,
        required this.enqGenById,
        required this.salesExId,
        required this.sourceId,
        required this.noOfVisitor,
        required this.scheme,
        required this.priority,
        required this.interestIn,
        required this.modelId,
        required this.colourId,
        required this.remarkInterest,
        required this.modelTestId,
        required this.modelTestDate,
        required this.remarkModelTest,
        required this.appointmentDate,
        required this.appointmentTime,
        required this.remarkAppointment,
        required this.remarkSpecial,
        required this.lastContactDate,
        required this.lastRemark,
        required this.lastActionTaken,
        required this.currentAppointmentDate,
        required this.enquiryStatus,
        required this.reason,
        required this.vehiclePurchase,
        required this.booking,
        required this.a,
        required this.b,
        required this.c,
        required this.d,
        required this.e,
        required this.f,
        required this.g,
    });

    factory Visitermodel.fromJson(Map<String, dynamic> json) => Visitermodel(
        id: json["id"],
        locationId: json["location_Id"],
        prefixName: prefixNameValues.map[json["prefix_Name"]]!,
        refNo: json["ref_No"],
        refDate: refDateValues.map[json["ref_Date"]]!,
        refTime: json["ref_Time"],
        titleId: json["title_Id"],
        genderName: genderNameValues.map[json["gender_Name"]]!,
        customerName: json["customer_Name"],
        contactName: contactNameValues.map[json["contact_Name"]]!,
        sanOffName: json["sanOff_Name"],
        addressDetails: json["address_Details"],
        address2: json["address2"],
        cityId: json["city_Id"],
        city: cityValues.map[json["city"]]!,
        pinCode: json["pin_Code"],
        mobNo: json["mob_No"],
        phonNo: json["phon_No"],
        stdCode: json["std_Code"],
        faxNo: faxNoValues.map[json["fax_No"]]!,
        emailId: json["email_Id"],
        birthdayDate: json["birthday_Date"],
        anniversaryDate: anniversaryDateValues.map[json["anniversary_Date"]]!,
        enqType: json["enq_Type"],
        modeType: json["mode_Type"],
        occupation: json["occupation"],
        income: json["income"],
        enqGenById: json["enqGenBy_Id"],
        salesExId: json["salesEx_id"],
        sourceId: json["source_Id"],
        noOfVisitor: noOfVisitorValues.map[json["noOfVisitor"]]!,
        scheme: json["scheme"],
        priority: json["priority"],
        interestIn: json["interestIn"],
        modelId: json["model_Id"],
        colourId: json["colour_Id"],
        remarkInterest: json["remark_interest"],
        modelTestId: json["modelTest_Id"],
        modelTestDate: json["modelTest_Date"],
        remarkModelTest: json["remark_ModelTest"],
        appointmentDate: json["appointment_Date"],
        appointmentTime: appointmentTimeValues.map[json["appointment_Time"]]!,
        remarkAppointment: json["remark_Appointment"],
        remarkSpecial: json["remark_Special"],
        lastContactDate: json["lastContact_Date"],
        lastRemark: cityValues.map[json["last_Remark"]]!,
        lastActionTaken: json["last_ActionTaken"],
        currentAppointmentDate: json["currentAppointmentDate"],
        enquiryStatus: json["enquiryStatus"],
        reason: json["reason"],
        vehiclePurchase: json["vehiclePurchase"],
        booking: json["booking"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        e: json["e"],
        f: json["f"],
        g: json["g"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "location_Id": locationId,
        "prefix_Name": prefixNameValues.reverse[prefixName],
        "ref_No": refNo,
        "ref_Date": refDateValues.reverse[refDate],
        "ref_Time": refTime,
        "title_Id": titleId,
        "gender_Name": genderNameValues.reverse[genderName],
        "customer_Name": customerName,
        "contact_Name": contactNameValues.reverse[contactName],
        "sanOff_Name": sanOffName,
        "address_Details": addressDetails,
        "address2": address2,
        "city_Id": cityId,
        "city": cityValues.reverse[city],
        "pin_Code": pinCode,
        "mob_No": mobNo,
        "phon_No": phonNo,
        "std_Code": stdCode,
        "fax_No": faxNoValues.reverse[faxNo],
        "email_Id": emailId,
        "birthday_Date": birthdayDate,
        "anniversary_Date": anniversaryDateValues.reverse[anniversaryDate],
        "enq_Type": enqType,
        "mode_Type": modeType,
        "occupation": occupation,
        "income": income,
        "enqGenBy_Id": enqGenById,
        "salesEx_id": salesExId,
        "source_Id": sourceId,
        "noOfVisitor": noOfVisitorValues.reverse[noOfVisitor],
        "scheme": scheme,
        "priority": priority,
        "interestIn": interestIn,
        "model_Id": modelId,
        "colour_Id": colourId,
        "remark_interest": remarkInterest,
        "modelTest_Id": modelTestId,
        "modelTest_Date": modelTestDate,
        "remark_ModelTest": remarkModelTest,
        "appointment_Date": appointmentDate,
        "appointment_Time": appointmentTimeValues.reverse[appointmentTime],
        "remark_Appointment": remarkAppointment,
        "remark_Special": remarkSpecial,
        "lastContact_Date": lastContactDate,
        "last_Remark": cityValues.reverse[lastRemark],
        "last_ActionTaken": lastActionTaken,
        "currentAppointmentDate": currentAppointmentDate,
        "enquiryStatus": enquiryStatus,
        "reason": reason,
        "vehiclePurchase": vehiclePurchase,
        "booking": booking,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "e": e,
        "f": f,
        "g": g,
    };
}

enum AnniversaryDate {
    AUTO_WHEEL
}

final anniversaryDateValues = EnumValues({
    "AutoWheel": AnniversaryDate.AUTO_WHEEL
});

enum AppointmentTime {
    RAJ
}

final appointmentTimeValues = EnumValues({
    "Raj": AppointmentTime.RAJ
});

enum City {
    JAIPUR
}

final cityValues = EnumValues({
    "jaipur": City.JAIPUR
});

enum ContactName {
    RAJ1,
    RAJ81
}

final contactNameValues = EnumValues({
    "raj1": ContactName.RAJ1,
    "raj81": ContactName.RAJ81
});

enum FaxNo {
    FAX
}

final faxNoValues = EnumValues({
    "fax": FaxNo.FAX
});

enum GenderName {
    MALE
}

final genderNameValues = EnumValues({
    "Male": GenderName.MALE
});

enum NoOfVisitor {
    KMALESH_ONSIDE_DEAL_AMOUNT_NOT_CONFIRM
}

final noOfVisitorValues = EnumValues({
    "Kmalesh Onside deal amount not confirm": NoOfVisitor.KMALESH_ONSIDE_DEAL_AMOUNT_NOT_CONFIRM
});

enum PrefixName {
    MOHANDHANKA,
    MOHANDHANKA5,
    ONLINE,
    RAHUL12
}

final prefixNameValues = EnumValues({
    "mohandhanka": PrefixName.MOHANDHANKA,
    "mohandhanka5": PrefixName.MOHANDHANKA5,
    "Online": PrefixName.ONLINE,
    "Rahul12": PrefixName.RAHUL12
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
