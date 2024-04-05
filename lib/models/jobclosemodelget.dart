// To parse this JSON data, do
//
//     final jobclosemodelget = jobclosemodelgetFromJson(jsonString);

import 'dart:convert';

Jobclosemodelget jobclosemodelgetFromJson(String str) => Jobclosemodelget.fromJson(json.decode(str));

String jobclosemodelgetToJson(Jobclosemodelget data) => json.encode(data.toJson());

class Jobclosemodelget {
    final int srNo;
    final String prefixName;
    final int jobNo;
    final String jobDate;
    final String vehicleNo;
    final String chassisNo;
    final String engineNo;
    final int modelId;
    final int colourId;
    final int sourceId;
    final int serviceTypeId;
    final dynamic couponNo;
    final dynamic serviceNo;
    final dynamic kms;
    final dynamic fuel;
    final dynamic vehicleSold;
    final int mechanicId;
    final int workMgrId;
    final int ledgerId;
    final dynamic customerName;
    final dynamic jobIn;
    final dynamic jobInTime;
    final dynamic jobOut;
    final dynamic jobOutTime;
    final dynamic customerVoice;
    final dynamic jobStatus;
    final dynamic nextServiceInDays;
    final dynamic nextServiceOnDate;
    final dynamic insuranceRenewal;
    final int locationId;
    final dynamic remarks;
    final String extra1;
    final String extra2;
    final String extra3;
    final String extra4;
    final List<dynamic> jobCardItems;

    Jobclosemodelget({
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

    factory Jobclosemodelget.fromJson(Map<String, dynamic> json) => Jobclosemodelget(
        srNo: json["sr_No"],
        prefixName: json["prefix_Name"],
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
        jobInTime: json["job_InTime"],
        jobOut: json["job_Out"],
        jobOutTime: json["job_OutTime"],
        customerVoice: json["customer_Voice"],
        jobStatus: json["job_Status"],
        nextServiceInDays: json["next_ServiceInDays"],
        nextServiceOnDate: json["next_ServiceOnDate"],
        insuranceRenewal: json["insurance_Renewal"],
        locationId: json["location_Id"],
        remarks: json["remarks"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        extra3: json["extra3"],
        extra4: json["extra4"],
        jobCardItems: List<dynamic>.from(json["jobCard_Items"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "sr_No": srNo,
        "prefix_Name": prefixName,
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
        "job_InTime": jobInTime,
        "job_Out": jobOut,
        "job_OutTime": jobOutTime,
        "customer_Voice": customerVoice,
        "job_Status": jobStatus,
        "next_ServiceInDays": nextServiceInDays,
        "next_ServiceOnDate": nextServiceOnDate,
        "insurance_Renewal": insuranceRenewal,
        "location_Id": locationId,
        "remarks": remarks,
        "extra1": extra1,
        "extra2": extra2,
        "extra3": extra3,
        "extra4": extra4,
        "jobCard_Items": List<dynamic>.from(jobCardItems.map((x) => x)),
    };
}
