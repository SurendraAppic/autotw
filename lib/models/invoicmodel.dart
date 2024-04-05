// To parse this JSON data, do
//
//     final invocmodel = invocmodelFromJson(jsonString);

import 'dart:convert';

Invocmodel invocmodelFromJson(String str) => Invocmodel.fromJson(json.decode(str));

String invocmodelToJson(Invocmodel data) => json.encode(data.toJson());

class Invocmodel {
    final int srNo;
    final int locationId;
    final String prefixName;
    final int invoiceNo;
    final String invoiceDate;
    final int ledgerId;
    final dynamic ledgerName;
    final String vehicleNo;
    final String modelName;
    final String partyName;
    final String address;
    final String mob;
    final String cityName;
    final String grossAmount;
    final String taxableAmount;
    final String gst;
    final String discount;
    final dynamic netAmount;
    final String cashSale;
    final String creditSale;
    final String cardSale;
    final String paymentType;
    final String otherCharge;
    final String saleType;
    final int jobCardNo;
    final String remarks;
    final String a;
    final String b;
    final String c;
    final String d;
    final String e;
    final String f;
    final int miscChargeId;
    final String miscCharge;
    final int miscPer;
    final int miscAmount;
    final double igstText;
    final int cgstTax;
    final int sgstTax;
    final int cessTax;
    final String extra1;
    final String extra2;
    final String extra3;
    final String extra4;
    final String prefixNameJob;
    final String prefixNameReceipt;
    final int receiptNo;
    final int advanceAmt;
    final int modeId;
    final int balanceAmt;
    final String einvoiceStatus;
    final List<SaleInvoiceItem> saleInvoiceItems;

    Invocmodel({
        required this.srNo,
        required this.locationId,
        required this.prefixName,
        required this.invoiceNo,
        required this.invoiceDate,
        required this.ledgerId,
        required this.ledgerName,
        required this.vehicleNo,
        required this.modelName,
        required this.partyName,
        required this.address,
        required this.mob,
        required this.cityName,
        required this.grossAmount,
        required this.taxableAmount,
        required this.gst,
        required this.discount,
        required this.netAmount,
        required this.cashSale,
        required this.creditSale,
        required this.cardSale,
        required this.paymentType,
        required this.otherCharge,
        required this.saleType,
        required this.jobCardNo,
        required this.remarks,
        required this.a,
        required this.b,
        required this.c,
        required this.d,
        required this.e,
        required this.f,
        required this.miscChargeId,
        required this.miscCharge,
        required this.miscPer,
        required this.miscAmount,
        required this.igstText,
        required this.cgstTax,
        required this.sgstTax,
        required this.cessTax,
        required this.extra1,
        required this.extra2,
        required this.extra3,
        required this.extra4,
        required this.prefixNameJob,
        required this.prefixNameReceipt,
        required this.receiptNo,
        required this.advanceAmt,
        required this.modeId,
        required this.balanceAmt,
        required this.einvoiceStatus,
        required this.saleInvoiceItems,
    });

    factory Invocmodel.fromJson(Map<String, dynamic> json) => Invocmodel(
        srNo: json["sr_No"],
        locationId: json["location_Id"],
        prefixName: json["prefix_Name"],
        invoiceNo: json["invoice_No"],
        invoiceDate: json["invoice_Date"],
        ledgerId: json["ledger_Id"],
        ledgerName: json["ledger_Name"],
        vehicleNo: json["vehicle_No"],
        modelName: json["model_Name"],
        partyName: json["party_Name"],
        address: json["address"],
        mob: json["mob"],
        cityName: json["city_Name"],
        grossAmount: json["gross_Amount"],
        taxableAmount: json["taxable_Amount"],
        gst: json["gst"],
        discount: json["discount"],
        netAmount: json["net_Amount"],
        cashSale: json["cash_Sale"],
        creditSale: json["credit_Sale"],
        cardSale: json["card_Sale"],
        paymentType: json["payment_Type"],
        otherCharge: json["other_Charge"],
        saleType: json["sale_Type"],
        jobCardNo: json["jobCard_No"],
        remarks: json["remarks"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        e: json["e"],
        f: json["f"],
        miscChargeId: json["misc_Charge_Id"],
        miscCharge: json["misc_Charge"],
        miscPer: json["misc_Per"],
        miscAmount: json["misc_Amount"],
        igstText: json["igst_Text"]?.toDouble(),
        cgstTax: json["cgst_Tax"],
        sgstTax: json["sgst_Tax"],
        cessTax: json["cess_Tax"],
        extra1: json["extra1"],
        extra2: json["extra2"],
        extra3: json["extra3"],
        extra4: json["extra4"],
        prefixNameJob: json["prefix_Name_Job"],
        prefixNameReceipt: json["prefix_Name_Receipt"],
        receiptNo: json["receiptNo"],
        advanceAmt: json["advanceAmt"],
        modeId: json["mode_Id"],
        balanceAmt: json["balanceAmt"],
        einvoiceStatus: json["einvoiceStatus"],
        saleInvoiceItems: List<SaleInvoiceItem>.from(json["sale_Invoice_Items"].map((x) => SaleInvoiceItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sr_No": srNo,
        "location_Id": locationId,
        "prefix_Name": prefixName,
        "invoice_No": invoiceNo,
        "invoice_Date": invoiceDate,
        "ledger_Id": ledgerId,
        "ledger_Name": ledgerName,
        "vehicle_No": vehicleNo,
        "model_Name": modelName,
        "party_Name": partyName,
        "address": address,
        "mob": mob,
        "city_Name": cityName,
        "gross_Amount": grossAmount,
        "taxable_Amount": taxableAmount,
        "gst": gst,
        "discount": discount,
        "net_Amount": netAmount,
        "cash_Sale": cashSale,
        "credit_Sale": creditSale,
        "card_Sale": cardSale,
        "payment_Type": paymentType,
        "other_Charge": otherCharge,
        "sale_Type": saleType,
        "jobCard_No": jobCardNo,
        "remarks": remarks,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "e": e,
        "f": f,
        "misc_Charge_Id": miscChargeId,
        "misc_Charge": miscCharge,
        "misc_Per": miscPer,
        "misc_Amount": miscAmount,
        "igst_Text": igstText,
        "cgst_Tax": cgstTax,
        "sgst_Tax": sgstTax,
        "cess_Tax": cessTax,
        "extra1": extra1,
        "extra2": extra2,
        "extra3": extra3,
        "extra4": extra4,
        "prefix_Name_Job": prefixNameJob,
        "prefix_Name_Receipt": prefixNameReceipt,
        "receiptNo": receiptNo,
        "advanceAmt": advanceAmt,
        "mode_Id": modeId,
        "balanceAmt": balanceAmt,
        "einvoiceStatus": einvoiceStatus,
        "sale_Invoice_Items": List<dynamic>.from(saleInvoiceItems.map((x) => x.toJson())),
    };
}

class SaleInvoiceItem {
    final int id;
    final int locationId;
    final String prefixName;
    final int invoiceNo;
    final String item;
    final String itemName;
    final String hsnCode;
    final String qty;
    final String mrp;
    final String salePrice;
    final String totalPrice;
    final String gst;
    final String gstAmount;
    final int cess;
    final int cessAmount;
    final String taxable;
    final String labour;
    final String discountItem;
    final String type;
    final String tranDate;
    final String formType;
    final int warrantyTypeId;
    final int mechnicId;
    final String issueDate;
    final int itemId;
    final int hsnId;
    final int id1;
    final int id2;
    final int id3;
    final int id4;
    final int id5;
    final int jobCardNo;
    final dynamic prefixNameJob;
    final double igstAmount;
    final int cgstAmount;
    final int sgstAmount;
    final int reqserialno;

    SaleInvoiceItem({
        required this.id,
        required this.locationId,
        required this.prefixName,
        required this.invoiceNo,
        required this.item,
        required this.itemName,
        required this.hsnCode,
        required this.qty,
        required this.mrp,
        required this.salePrice,
        required this.totalPrice,
        required this.gst,
        required this.gstAmount,
        required this.cess,
        required this.cessAmount,
        required this.taxable,
        required this.labour,
        required this.discountItem,
        required this.type,
        required this.tranDate,
        required this.formType,
        required this.warrantyTypeId,
        required this.mechnicId,
        required this.issueDate,
        required this.itemId,
        required this.hsnId,
        required this.id1,
        required this.id2,
        required this.id3,
        required this.id4,
        required this.id5,
        required this.jobCardNo,
        required this.prefixNameJob,
        required this.igstAmount,
        required this.cgstAmount,
        required this.sgstAmount,
        required this.reqserialno,
    });

    factory SaleInvoiceItem.fromJson(Map<String, dynamic> json) => SaleInvoiceItem(
        id: json["id"],
        locationId: json["location_Id"],
        prefixName: json["prefix_Name"],
        invoiceNo: json["invoice_No"],
        item: json["item"],
        itemName: json["item_Name"],
        hsnCode: json["hsn_Code"],
        qty: json["qty"],
        mrp: json["mrp"],
        salePrice: json["sale_Price"],
        totalPrice: json["total_Price"],
        gst: json["gst"],
        gstAmount: json["gst_Amount"],
        cess: json["cess"],
        cessAmount: json["cess_Amount"],
        taxable: json["taxable"],
        labour: json["labour"],
        discountItem: json["discount_Item"],
        type: json["type"],
        tranDate: json["tranDate"],
        formType: json["form_Type"],
        warrantyTypeId: json["warranty_TypeId"],
        mechnicId: json["mechnic_Id"],
        issueDate: json["issue_Date"],
        itemId: json["itemId"],
        hsnId: json["hsn_Id"],
        id1: json["id1"],
        id2: json["id2"],
        id3: json["id3"],
        id4: json["id4"],
        id5: json["id5"],
        jobCardNo: json["jobCard_No"],
        prefixNameJob: json["prefix_Name_Job"],
        igstAmount: json["igstAmount"]?.toDouble(),
        cgstAmount: json["cgstAmount"],
        sgstAmount: json["sgstAmount"],
        reqserialno: json["reqserialno"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "location_Id": locationId,
        "prefix_Name": prefixName,
        "invoice_No": invoiceNo,
        "item": item,
        "item_Name": itemName,
        "hsn_Code": hsnCode,
        "qty": qty,
        "mrp": mrp,
        "sale_Price": salePrice,
        "total_Price": totalPrice,
        "gst": gst,
        "gst_Amount": gstAmount,
        "cess": cess,
        "cess_Amount": cessAmount,
        "taxable": taxable,
        "labour": labour,
        "discount_Item": discountItem,
        "type": type,
        "tranDate": tranDate,
        "form_Type": formType,
        "warranty_TypeId": warrantyTypeId,
        "mechnic_Id": mechnicId,
        "issue_Date": issueDate,
        "itemId": itemId,
        "hsn_Id": hsnId,
        "id1": id1,
        "id2": id2,
        "id3": id3,
        "id4": id4,
        "id5": id5,
        "jobCard_No": jobCardNo,
        "prefix_Name_Job": prefixNameJob,
        "igstAmount": igstAmount,
        "cgstAmount": cgstAmount,
        "sgstAmount": sgstAmount,
        "reqserialno": reqserialno,
    };
}
