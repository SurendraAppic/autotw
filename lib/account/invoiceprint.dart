// ignore_for_file: unused_import, deprecated_member_use

import 'dart:io';

import 'package:autowheelapp/account/pdfinvoic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceApi {
  static Future<File> generate({
    PdfColor? color,
    pw.Font? fontFamily,
    required String partynamedeta,
    required String datetimedeta,
    required String addressdeta,
    required int gst,
    required String vichalnumbar,
    required String modelname,
    required String TexiablAmount,
    required String igsttext,
    required String km,
    required String Phonenumbar,
    required int invoicnumbar,
    required int jobnumbar,
    required double discountamount,
    required List<dynamic> saleItemList,

    // required ,
  }) async {
    final pdf = pw.Document();

    final iconImage = (await rootBundle.load('assets/AutoWheel Logo.jpg'))
        .buffer
        .asUint8List();

    final tableHeaders = [
      'Item.Desscip.',
      'HSN',
      'QTY',
      'Price',
      'GST %',
      'GST Amount',
      'Texable'
    ];
    List<List<String>> convertSaleItemList(List<dynamic> saleItemList) {
      List<List<String>> convertedList = [];
      // Add table headers
      // convertedList.add(
      //     ['Item Name', 'HSN', 'Qty', 'Sale Price', 'GST Amount', 'Taxable']);

      // Add data rows
      for (var item in saleItemList) {
        List<String> rowData = [
          item.itemName.toString(),
          item.hsnCode.toString(),
          item.qty.toString(),
          item.mrp.toString(),
          item.gst.toString(),
          item.igstAmount.toString(),
          item.taxable.toString(),
        ];
        convertedList.add(rowData);
      }

      return convertedList;
    }

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1),
                ),
                child: pw.Column(children: [
                  pw.SizedBox(height: 2 * PdfPageFormat.mm),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(' GstIN: 087865456787'.padLeft(2)),
                        pw.SizedBox(width: 18 * PdfPageFormat.mm),
                        pw.Text('Subject To Tihana Dummy'),
                        pw.SizedBox(width: 18 * PdfPageFormat.mm),
                        pw.Text('orglinal copy ',
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold))
                      ]),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Text('   Meharja AutoMobile',
                      style: pw.TextStyle(
                          fontSize: 13,
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.bold)),
                  pw.Stack(
                    alignment: pw.Alignment.bottomCenter,
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Padding(
                            padding: pw.EdgeInsets.all(5),
                            child: pw.Image(
                              pw.MemoryImage(iconImage),
                              height: 72,
                              width: 72,
                            )),
                      ),
                      pw.Align(
                          alignment: pw.Alignment.bottomCenter,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Text('Jaipur Jaipur'),
                              pw.SizedBox(height: 2 * PdfPageFormat.mm),
                              pw.Text('Rajesthan-303007'),
                              pw.SizedBox(height: 2 * PdfPageFormat.mm),
                              pw.Text(
                                  '${Phonenumbar}-9024240876 gurukirpa@gmail.com'),
                              pw.SizedBox(height: 2 * PdfPageFormat.mm),
                            ],
                          )),
                    ],
                  ),
                  pw.Divider(height: 8),
                  pw.Text('TAX INVOICE'),
                  pw.Divider(height: 8),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.only(left: 8),
                        child: pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  // 'Party Name: ${invocModel!.partyName}',
                                  'Party Name      :    ${partynamedeta}',
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 11.0,
                                    color: PdfColors.black,
                                    font: fontFamily,
                                  ),
                                ),
                                pw.SizedBox(height: 1 * PdfPageFormat.mm),
                                pw.Text(
                                  'Address     :  ${addressdeta}',
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 11.0,
                                    color: PdfColors.black,
                                    font: fontFamily,
                                  ),
                                ),
                                pw.SizedBox(height: 9 * PdfPageFormat.mm),
                                pw.Text(
                                  'Phone        : ${Phonenumbar} ',
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 11.0,
                                    color: PdfColors.black,
                                    font: fontFamily,
                                  ),
                                ),
                                pw.SizedBox(height: 1 * PdfPageFormat.mm),
                                pw.Text(
                                  'Gst      : ${gst} ',
                                  textAlign: pw.TextAlign.justify,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 11.0,
                                    color: PdfColors.black,
                                    font: fontFamily,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      pw.SizedBox(width: 45 * PdfPageFormat.mm),
                      pw.Container(
                        height: 100,
                        width: 1,
                        color: PdfColors.black,
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Invoic Numbar : ${invoicnumbar}',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                font: fontFamily,
                              ),
                            ),
                            pw.SizedBox(height: 1 * PdfPageFormat.mm),
                            pw.Text(
                              'Date Time :${datetimedeta}',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                color: PdfColors.black,
                                font: fontFamily,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 1 * PdfPageFormat.mm),
                            pw.Text(
                              'Model Name :${modelname}',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                font: fontFamily,
                              ),
                            ),
                            pw.SizedBox(height: 1 * PdfPageFormat.mm),
                            pw.Text(
                              'Vichal NO. :   ${vichalnumbar}',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                font: fontFamily,
                              ),
                            ),
                            pw.SizedBox(height: 5 * PdfPageFormat.mm),
                            pw.Text(
                              'Km    :   ${km} ',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                font: fontFamily,
                              ),
                            ),
                            pw.SizedBox(height: 1 * PdfPageFormat.mm),
                            pw.Text(
                              'Job No. :  ${jobnumbar} ',
                              textAlign: pw.TextAlign.justify,
                              style: pw.TextStyle(
                                fontSize: 11.0,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                                font: fontFamily,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  pw.Table.fromTextArray(
                    headers: tableHeaders,
                    data: convertSaleItemList(saleItemList),
                    border: null,
                    headerStyle: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 9),
                    headerDecoration:
                        const pw.BoxDecoration(color: PdfColors.grey300),
                    cellHeight: 30.0,
                  ),
                  pw.Divider(height: 20),
                  pw.Row(children: [
                    pw.Text("Total Labour:        00  ",
                        style: pw.TextStyle(fontSize: 10)),
                    pw.Text("Other Amount:        00   ",
                        style: pw.TextStyle(fontSize: 10)),
                    pw.Text("Total Qty.:        00      ",
                        style: pw.TextStyle(fontSize: 10)),
                    pw.Text(
                        "Texable Amount:   ${TexiablAmount}    ".padLeft(20),
                        style: pw.TextStyle(fontSize: 10)),
                  ]),
                  pw.Divider(height: 8),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text("IGST Amount :         ${igsttext} "),
                          pw.Text("CGST Amount :          00  "),
                          pw.Text("SGST Amount :          00  "),
                          pw.Text("Discount    :       ${discountamount} "),
                        ],
                      )),
                  pw.Divider(height: 8),
                  pw.Row(
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text("  Remark  : ",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.Text(" Total Amount : ".padLeft(100)),
                    ],
                  ),
                  pw.Divider(height: 8),
                  pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(" Terems and Condition".padLeft(2),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(
                                " 1.Peyment by Cheque/DD/Pay Order in favour our Campany"
                                    .padLeft(2),
                                style: pw.TextStyle(fontSize: 10)),
                            pw.Text(
                                " 2.Delivery is subject to availabilty of Stock/Colour and Normal prodction schedule"
                                    .padLeft(2),
                                style: pw.TextStyle(fontSize: 10)),
                            pw.Text(
                                " 3.Prices are subject to change without prior information.                                       For :  "
                                    .padLeft(2),
                                style: pw.TextStyle(fontSize: 10)),
                            pw.Text(
                                " 4.We Decleare that this invoic shows the actual price of the googs \ndescribed and that all praticulars are true and correct.",
                                style: pw.TextStyle(fontSize: 10)),
                            pw.SizedBox(height: 20 * PdfPageFormat.mm),
                            pw.Text(
                                "  Customer Signture                                                                  Authorised Signture"),
                            pw.SizedBox(height: 5 * PdfPageFormat.mm),
                          ]))
                ]))
          ];
        },
      ),
    );

    return FileHandleApi.saveDocument(name: 'AutoWheel Soft. invoic', pdf: pdf);
  }
}
