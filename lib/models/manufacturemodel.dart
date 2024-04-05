// To parse this JSON data, do
//
//     final manufacturemodeldeta = manufacturemodeldetaFromJson(jsonString);

import 'dart:convert';

List<Manufacturemodeldeta> manufacturemodeldetaFromJson(String str) => List<Manufacturemodeldeta>.from(json.decode(str).map((x) => Manufacturemodeldeta.fromJson(x)));

String manufacturemodeldetaToJson(List<Manufacturemodeldeta> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Manufacturemodeldeta {
    final int ledgerId;
    final int titleId;
    final String ledgerName;
    final dynamic sonOff;
    final dynamic address;
    final dynamic address2;
    final int cityId;
    final dynamic stdCode;
    final dynamic mob;
    final dynamic pinCode;
    final int ledgerGroupId;
    final dynamic openingBal;
    final dynamic openingBalCombo;
    final dynamic gstNo;
    final dynamic addressTa;
    final dynamic address2Ta;
    final int cityIdTa;
    final dynamic stdCodeTa;
    final dynamic mobTa;
    final dynamic pinCodeTa;
    final dynamic subcidyIdNo;
    final dynamic dueDate;
    final dynamic closingBal;
    final dynamic closingBalType;
    final int categoryId;
    final int staffId;
    final dynamic creditLimit;
    final dynamic creditDays;
    final int whatappNo;
    final dynamic emailId;
    final dynamic birthdayDate;
    final dynamic anniversaryDate;
    final dynamic distanceKm;
    final dynamic discountSource;
    final dynamic discountValid;
    final int locationId;
    final dynamic panNo;
    final dynamic tinNo;
    final dynamic billingName;
    final dynamic remarks;
    final dynamic shortName;
    final dynamic contactPerson;
    final dynamic wefDate;
    final dynamic other1;
    final dynamic other2;
    final dynamic other3;
    final dynamic other4;
    final dynamic other5;
    final int otherNumber1;
    final int otherNumber2;
    final int otherNumber3;
    final int otherNumber4;
    final int otherNumber5;
    final dynamic aadharNo;
    final int gstTypeId;
    final dynamic hsnCode;
    final int igst;
    final int cgst;
    final int sgst;
    final int cess;
    final int rcmStatus;
    final int itcStatus;
    final int expencesTypeId;
    final int rcmCategory;

    Manufacturemodeldeta({
        required this.ledgerId,
        required this.titleId,
        required this.ledgerName,
        required this.sonOff,
        required this.address,
        required this.address2,
        required this.cityId,
        required this.stdCode,
        required this.mob,
        required this.pinCode,
        required this.ledgerGroupId,
        required this.openingBal,
        required this.openingBalCombo,
        required this.gstNo,
        required this.addressTa,
        required this.address2Ta,
        required this.cityIdTa,
        required this.stdCodeTa,
        required this.mobTa,
        required this.pinCodeTa,
        required this.subcidyIdNo,
        required this.dueDate,
        required this.closingBal,
        required this.closingBalType,
        required this.categoryId,
        required this.staffId,
        required this.creditLimit,
        required this.creditDays,
        required this.whatappNo,
        required this.emailId,
        required this.birthdayDate,
        required this.anniversaryDate,
        required this.distanceKm,
        required this.discountSource,
        required this.discountValid,
        required this.locationId,
        required this.panNo,
        required this.tinNo,
        required this.billingName,
        required this.remarks,
        required this.shortName,
        required this.contactPerson,
        required this.wefDate,
        required this.other1,
        required this.other2,
        required this.other3,
        required this.other4,
        required this.other5,
        required this.otherNumber1,
        required this.otherNumber2,
        required this.otherNumber3,
        required this.otherNumber4,
        required this.otherNumber5,
        required this.aadharNo,
        required this.gstTypeId,
        required this.hsnCode,
        required this.igst,
        required this.cgst,
        required this.sgst,
        required this.cess,
        required this.rcmStatus,
        required this.itcStatus,
        required this.expencesTypeId,
        required this.rcmCategory,
    });

    factory Manufacturemodeldeta.fromJson(Map<String, dynamic> json) => Manufacturemodeldeta(
        ledgerId: json["ledger_Id"],
        titleId: json["title_Id"],
        ledgerName: json["ledger_Name"],
        sonOff: json["son_Off"],
        address: json["address"],
        address2: json["address2"],
        cityId: json["city_Id"],
        stdCode: json["std_Code"],
        mob: json["mob"],
        pinCode: json["pin_Code"],
        ledgerGroupId: json["ledger_Group_Id"],
        openingBal: json["opening_Bal"],
        openingBalCombo: json["opening_Bal_Combo"],
        gstNo: json["gst_No"],
        addressTa: json["address_TA"],
        address2Ta: json["address2_TA"],
        cityIdTa: json["city_Id_TA"],
        stdCodeTa: json["std_Code_TA"],
        mobTa: json["mob_TA"],
        pinCodeTa: json["pin_Code_TA"],
        subcidyIdNo: json["subcidyIdNo"],
        dueDate: json["dueDate"],
        closingBal: json["closingBal"],
        closingBalType: json["closingBal_Type"],
        categoryId: json["category_Id"],
        staffId: json["staff_Id"],
        creditLimit: json["creditLimit"],
        creditDays: json["creditDays"],
        whatappNo: json["whatappNo"],
        emailId: json["emailId"],
        birthdayDate: json["birthdayDate"],
        anniversaryDate: json["anniversaryDate"],
        distanceKm: json["distanceKm"],
        discountSource: json["discountSource"],
        discountValid: json["discountValid"],
        locationId: json["location_Id"],
        panNo: json["panNo"],
        tinNo: json["tinNo"],
        billingName: json["billingName"],
        remarks: json["remarks"],
        shortName: json["shortName"],
        contactPerson: json["contactPerson"],
        wefDate: json["wefDate"],
        other1: json["other1"],
        other2: json["other2"],
        other3: json["other3"],
        other4: json["other4"],
        other5: json["other5"],
        otherNumber1: json["otherNumber1"],
        otherNumber2: json["otherNumber2"],
        otherNumber3: json["otherNumber3"],
        otherNumber4: json["otherNumber4"],
        otherNumber5: json["otherNumber5"],
        aadharNo: json["aadharNo"],
        gstTypeId: json["gstTypeId"],
        hsnCode: json["hsnCode"],
        igst: json["igst"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        cess: json["cess"],
        rcmStatus: json["rcmStatus"],
        itcStatus: json["itcStatus"],
        expencesTypeId: json["expencesTypeId"],
        rcmCategory: json["rcmCategory"],
    );

    Map<String, dynamic> toJson() => {
        "ledger_Id": ledgerId,
        "title_Id": titleId,
        "ledger_Name": ledgerName,
        "son_Off": sonOff,
        "address": address,
        "address2": address2,
        "city_Id": cityId,
        "std_Code": stdCode,
        "mob": mob,
        "pin_Code": pinCode,
        "ledger_Group_Id": ledgerGroupId,
        "opening_Bal": openingBal,
        "opening_Bal_Combo": openingBalCombo,
        "gst_No": gstNo,
        "address_TA": addressTa,
        "address2_TA": address2Ta,
        "city_Id_TA": cityIdTa,
        "std_Code_TA": stdCodeTa,
        "mob_TA": mobTa,
        "pin_Code_TA": pinCodeTa,
        "subcidyIdNo": subcidyIdNo,
        "dueDate": dueDate,
        "closingBal": closingBal,
        "closingBal_Type": closingBalType,
        "category_Id": categoryId,
        "staff_Id": staffId,
        "creditLimit": creditLimit,
        "creditDays": creditDays,
        "whatappNo": whatappNo,
        "emailId": emailId,
        "birthdayDate": birthdayDate,
        "anniversaryDate": anniversaryDate,
        "distanceKm": distanceKm,
        "discountSource": discountSource,
        "discountValid": discountValid,
        "location_Id": locationId,
        "panNo": panNo,
        "tinNo": tinNo,
        "billingName": billingName,
        "remarks": remarks,
        "shortName": shortName,
        "contactPerson": contactPerson,
        "wefDate": wefDate,
        "other1": other1,
        "other2": other2,
        "other3": other3,
        "other4": other4,
        "other5": other5,
        "otherNumber1": otherNumber1,
        "otherNumber2": otherNumber2,
        "otherNumber3": otherNumber3,
        "otherNumber4": otherNumber4,
        "otherNumber5": otherNumber5,
        "aadharNo": aadharNo,
        "gstTypeId": gstTypeId,
        "hsnCode": hsnCode,
        "igst": igst,
        "cgst": cgst,
        "sgst": sgst,
        "cess": cess,
        "rcmStatus": rcmStatus,
        "itcStatus": itcStatus,
        "expencesTypeId": expencesTypeId,
        "rcmCategory": rcmCategory,
    };
}
