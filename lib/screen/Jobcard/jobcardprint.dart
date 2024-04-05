// ignore_for_file: unused_import, deprecated_member_use

import 'dart:io';

import 'package:autowheelapp/account/pdfinvoic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfjobcardApi {
  static Future<File> generate({
    PdfColor? color,
    pw.Font? fontFamily,
    required List<dynamic> saleItemList,

    // required ,
  }) async {
    final pdf = pw.Document();

    final iconImage = (await rootBundle
            .load('assets/original-b794142546c3de42ba3045da64d0286c.jpg'))
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
                  // pw.SizedBox(height: 2 * PdfPageFormat.mm),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        // pw.Image(
                        //   pw.MemoryImage(iconImage),
                        //   height: 72,
                        //   width: 72,
                        // ),
                        pw.Padding(
                          padding: pw.EdgeInsets.all(
                              8.0), // Adjust the value as needed
                          child: pw.Image(
                            pw.MemoryImage(iconImage),
                            height: 72,
                            width: 72,
                          ),
                        ),

                        // pw.Text(' GstIN: 087865456787'.padLeft(2)),
                        pw.SizedBox(width: 18 * PdfPageFormat.mm),
                        pw.Text('Job Card',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 15)),
                        pw.SizedBox(width: 18 * PdfPageFormat.mm),
                        pw.Text('Orglinal copy  ',
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontWeight: pw.FontWeight.bold))
                      ]),
                  pw.SizedBox(height: 1 * PdfPageFormat.mm),
                  pw.Column(children: [
                    pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text('Mahi AutoMobile   ',
                          style: pw.TextStyle(
                              fontSize: 13,
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text('Odesha   ',
                          style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.grey,
                              fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text('7878589876  ',
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey,
                          )),
                    ),
                    pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text('gurukirpa@gmail.com   ',
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey,
                          )),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Text('    Toaken.......'),
                      pw.SizedBox(height: 2 * PdfPageFormat.mm),
                      pw.Text(
                          '                                       jobcard numabr - 1005'),
                      pw.SizedBox(height: 2 * PdfPageFormat.mm),
                    ],
                  ),

                  pw.Divider(height: 15),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(" Vehicle Model"),
                      pw.Container(
                        height: 30,
                        width: 1,
                        color: PdfColors.black,
                      ),
                      pw.Text(" Vehicle Model"),
                      pw.Container(
                        height: 30,
                        width: 1,
                        color: PdfColors.black,
                      ),
                      pw.Text(" Vehicle Model"),
                      pw.Container(
                        height: 30,
                        width: 1,
                        color: PdfColors.black,
                      ),
                      pw.Text(" Vehicle Model"),
                    ],
                  ),

                  pw.Divider(height: 15),
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
                                  // 'Party Name: {invocModel!.partyName}',
                                  'Customer Name     :    {partynamedeta}',
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
                                  'Contect No   :  {addressdeta}',
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
                                  'Gst No    : {Phonenumbar} ',
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
                                  'Chassis No     : {gst} ',
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
                                  'Engine  No     : {gst} ',
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
                                  'Km   : {gst} ',
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
                                  'Searvice Type : {gst} ',
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
                      pw.SizedBox(width: 35 * PdfPageFormat.mm),
                      // pw.Container(
                      //   height: 100,
                      //   width: 1,
                      //   color: PdfColors.black,
                      // ),
                      pw.Padding(
                        padding: pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Job Date : {invoicnumbar}',
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
                              'Model Color :{datetimedeta}',
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
                              'Coupon No. :{modelname}',
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
                              'Source :   ',
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
                              'Fule Type  :   ',
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

                  pw.Divider(height: 15),
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
                                  // 'Party Name: {invocModel!.partyName}',
                                  'Customer Name:{partynamedeta}',
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
                      pw.SizedBox(width: 10 * PdfPageFormat.mm),
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
                              'Job Date :  ',
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
                              'Model Color   :',
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
                              'Coupon No.  :',
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

                  pw.Divider(height: 8),
                  pw.Text('Part & Labour Detils:',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),

                  pw.Divider(height: 8),
                  pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Column(children: [
                      pw.Text(" 1, coustom is Hy Fi  man "),
                      pw.SizedBox(height: 1 * PdfPageFormat.mm),
                      pw.Text(" 1, coustom is Hy Fi  man "),
                      pw.SizedBox(height: 1 * PdfPageFormat.mm),
                      pw.Text(" 1, coustom is Hy Fi  man "),
                      pw.SizedBox(height: 1 * PdfPageFormat.mm),
                      pw.Text(" 1, coustom is Hy Fi  man "),
                      pw.SizedBox(height: 6 * PdfPageFormat.mm),
                    ]),
                  ),
                  // pw.Divider(height: 8),
                  // pw.Align(
                  //   alignment: pw.Alignment.centerLeft,
                  // ),
                  // pw.Text(
                  //     "...........................................................................",
                  //     style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Divider(height: 8),
                  pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Text("CUSTOMER AUTHORZATION".padLeft(2),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(
                                " 1.Peyment by Cheque/DD/Pay Order in favour our Campany"
                                    .padLeft(2),
                                style: pw.TextStyle(fontSize: 10)),
                            pw.Text(
                                " 2.Delivery is subject to availabilty of Stock/Colour and Normal prodction schedule"
                                    .padLeft(2),
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(
                                " 3.Prices are subject to change without prior information."
                                    .padLeft(2),
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(
                                " 4.We Decleare that this invoic shows the actual price of the googs \ndescribed and that all praticulars are true and correct.",
                                style: pw.TextStyle(fontSize: 10)),
                            pw.SizedBox(height: 20 * PdfPageFormat.mm),
                            pw.Text(
                                "                                                                                                        Customer Signture"),
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
