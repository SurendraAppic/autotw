// To parse this JSON data, do
//
//     final modeljobcardAlldeta = modeljobcardAlldetaFromJson(jsonString);

import 'dart:convert';

List<ModeljobcardAlldeta> modeljobcardAlldetaFromJson(String str) => List<ModeljobcardAlldeta>.from(json.decode(str).map((x) => ModeljobcardAlldeta.fromJson(x)));

String modeljobcardAlldetaToJson(List<ModeljobcardAlldeta> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModeljobcardAlldeta {
    final int srNo;
    final PrefixName prefixName;
    final int jobNo;
    final String jobDate;
    final String vehicleNo;
    final String chassisNo;
    final String engineNo;
    final int modelId;
    final int colourId;
    final int sourceId;
    final int serviceTypeId;
    final String couponNo;
    final String serviceNo;
    final String kms;
    final String fuel;
    final String vehicleSold;
    final int mechanicId;
    final int workMgrId;
    final int ledgerId;
    final String customerName;
    final String jobIn;
    final JobInTime jobInTime;
    final String jobOut;
    final String jobOutTime;
    final CustomerVoice customerVoice;
    final String jobStatus;
    final NextServiceInDays nextServiceInDays;
    final String nextServiceOnDate;
    final String insuranceRenewal;
    final int locationId;
    final Remarks remarks;
    final Extra1 extra1;
    final Extra2 extra2;
    final Extra3 extra3;
    final Extra4 extra4;
    final dynamic jobCardItems;

    ModeljobcardAlldeta({
        required this.srNo,
        required this.prefixName,
        required this.jobNo,
        required this.jobDate,
        required this.vehicleNo,
        required this.chassisNo,
        required this.engineNo,
        required this.modelId,
        required this.colourId,
        required this.sourceId,
        required this.serviceTypeId,
        required this.couponNo,
        required this.serviceNo,
        required this.kms,
        required this.fuel,
        required this.vehicleSold,
        required this.mechanicId,
        required this.workMgrId,
        required this.ledgerId,
        required this.customerName,
        required this.jobIn,
        required this.jobInTime,
        required this.jobOut,
        required this.jobOutTime,
        required this.customerVoice,
        required this.jobStatus,
        required this.nextServiceInDays,
        required this.nextServiceOnDate,
        required this.insuranceRenewal,
        required this.locationId,
        required this.remarks,
        required this.extra1,
        required this.extra2,
        required this.extra3,
        required this.extra4,
        required this.jobCardItems,
    });

    factory ModeljobcardAlldeta.fromJson(Map<String, dynamic> json) => ModeljobcardAlldeta(
        srNo: json["sr_No"],
        prefixName: prefixNameValues.map[json["prefix_Name"]]!,
        jobNo: json["job_No"],
        jobDate: json["job_Date"],
        vehicleNo: json["vehicle_No"],
        chassisNo: json["chassis_No"],
        engineNo: json["engine_No"],
        modelId: json["model_Id"],
        colourId: json["colour_Id"],
        sourceId: json["source_Id"],
        serviceTypeId: json["service_type_id"],
        couponNo: json["coupon_No"],
        serviceNo: json["service_No"],
        kms: json["kms"],
        fuel: json["fuel"],
        vehicleSold: json["vehicle_Sold"],
        mechanicId: json["mechanic_Id"],
        workMgrId: json["work_Mgr_Id"],
        ledgerId: json["ledger_Id"],
        customerName: json["customer_Name"],
        jobIn: json["job_In"],
        jobInTime: jobInTimeValues.map[json["job_InTime"]]!,
        jobOut: json["job_Out"],
        jobOutTime: json["job_OutTime"],
        customerVoice: customerVoiceValues.map[json["customer_Voice"]]!,
        jobStatus: json["job_Status"],
        nextServiceInDays: nextServiceInDaysValues.map[json["next_ServiceInDays"]]!,
        nextServiceOnDate: json["next_ServiceOnDate"],
        insuranceRenewal: json["insurance_Renewal"],
        locationId: json["location_Id"],
        remarks: remarksValues.map[json["remarks"]]!,
        extra1: extra1Values.map[json["extra1"]]!,
        extra2: extra2Values.map[json["extra2"]]!,
        extra3: extra3Values.map[json["extra3"]]!,
        extra4: extra4Values.map[json["extra4"]]!,
        jobCardItems: json["jobCard_Items"],
    );

    Map<String, dynamic> toJson() => {
        "sr_No": srNo,
        "prefix_Name": prefixNameValues.reverse[prefixName],
        "job_No": jobNo,
        "job_Date": jobDate,
        "vehicle_No": vehicleNo,
        "chassis_No": chassisNo,
        "engine_No": engineNo,
        "model_Id": modelId,
        "colour_Id": colourId,
        "source_Id": sourceId,
        "service_type_id": serviceTypeId,
        "coupon_No": couponNo,
        "service_No": serviceNo,
        "kms": kms,
        "fuel": fuel,
        "vehicle_Sold": vehicleSold,
        "mechanic_Id": mechanicId,
        "work_Mgr_Id": workMgrId,
        "ledger_Id": ledgerId,
        "customer_Name": customerName,
        "job_In": jobIn,
        "job_InTime": jobInTimeValues.reverse[jobInTime],
        "job_Out": jobOut,
        "job_OutTime": jobOutTime,
        "customer_Voice": customerVoiceValues.reverse[customerVoice],
        "job_Status": jobStatus,
        "next_ServiceInDays": nextServiceInDaysValues.reverse[nextServiceInDays],
        "next_ServiceOnDate": nextServiceOnDate,
        "insurance_Renewal": insuranceRenewal,
        "location_Id": locationId,
        "remarks": remarksValues.reverse[remarks],
        "extra1": extra1Values.reverse[extra1],
        "extra2": extra2Values.reverse[extra2],
        "extra3": extra3Values.reverse[extra3],
        "extra4": extra4Values.reverse[extra4],
        "jobCard_Items": jobCardItems,
    };
}

enum CustomerVoice {
    CUSTOMER_VOICE
}

final customerVoiceValues = EnumValues({
    "Customer_Voice": CustomerVoice.CUSTOMER_VOICE
});

enum Extra1 {
    EXTRA1
}

final extra1Values = EnumValues({
    "Extra1": Extra1.EXTRA1
});

enum Extra2 {
    EXTRA2
}

final extra2Values = EnumValues({
    "Extra2": Extra2.EXTRA2
});

enum Extra3 {
    EXTRA3
}

final extra3Values = EnumValues({
    "Extra3": Extra3.EXTRA3
});

enum Extra4 {
    EXTRA4
}

final extra4Values = EnumValues({
    "Extra4": Extra4.EXTRA4
});

enum JobInTime {
    THE_111900120000_AM,
    THE_1272024120000_AM
}

final jobInTimeValues = EnumValues({
    "1/1/1900 12:00:00 AM": JobInTime.THE_111900120000_AM,
    "1/27/2024 12:00:00 AM": JobInTime.THE_1272024120000_AM
});

enum NextServiceInDays {
    NEXT_SERVICE_IN_DAYS
}

final nextServiceInDaysValues = EnumValues({
    "Next_ServiceInDays": NextServiceInDays.NEXT_SERVICE_IN_DAYS
});

enum PrefixName {
    ONLINE
}

final prefixNameValues = EnumValues({
    "online": PrefixName.ONLINE
});

enum Remarks {
    REMARKS
}

final remarksValues = EnumValues({
    "Remarks": Remarks.REMARKS
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
