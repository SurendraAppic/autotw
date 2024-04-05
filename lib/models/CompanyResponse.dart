// To parse this JSON data, do
//
//     final companyResponse = companyResponseFromJson(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

CompanyResponse companyResponseFromJson(String str) => CompanyResponse.fromJson(json.decode(str));

String companyResponseToJson(CompanyResponse data) => json.encode(data.toJson());

class CompanyResponse {
    String stjCd;
    String lgnm;
    String stj;
    String dty;
    List<dynamic> adadr;
    String cxdt;
    List<String> nba;
    String gstin;
    String lstupdt;
    String rgdt;
    String ctb;
    Pradr pradr;
    String sts;
    String tradeNam;
    String ctjCd;
    String ctj;
    String einvoiceStatus;

    CompanyResponse({
        required this.stjCd,
        required this.lgnm,
        required this.stj,
        required this.dty,
        required this.adadr,
        required this.cxdt,
        required this.nba,
        required this.gstin,
        required this.lstupdt,
        required this.rgdt,
        required this.ctb,
        required this.pradr,
        required this.sts,
        required this.tradeNam,
        required this.ctjCd,
        required this.ctj,
        required this.einvoiceStatus,
    });

    factory CompanyResponse.fromJson(Map<String, dynamic> json) => CompanyResponse(
        stjCd: json["stjCd"],
        lgnm: json["lgnm"],
        stj: json["stj"],
        dty: json["dty"],
        adadr: List<dynamic>.from(json["adadr"].map((x) => x)),
        cxdt: json["cxdt"],
        nba: List<String>.from(json["nba"].map((x) => x)),
        gstin: json["gstin"],
        lstupdt: json["lstupdt"],
        rgdt: json["rgdt"],
        ctb: json["ctb"],
        pradr: Pradr.fromJson(json["pradr"]),
        sts: json["sts"],
        tradeNam: json["tradeNam"],
        ctjCd: json["ctjCd"],
        ctj: json["ctj"],
        einvoiceStatus: json["einvoiceStatus"],
    );

    Map<String, dynamic> toJson() => {
        "stjCd": stjCd,
        "lgnm": lgnm,
        "stj": stj,
        "dty": dty,
        "adadr": List<dynamic>.from(adadr.map((x) => x)),
        "cxdt": cxdt,
        "nba": List<dynamic>.from(nba.map((x) => x)),
        "gstin": gstin,
        "lstupdt": lstupdt,
        "rgdt": rgdt,
        "ctb": ctb,
        "pradr": pradr.toJson(),
        "sts": sts,
        "tradeNam": tradeNam,
        "ctjCd": ctjCd,
        "ctj": ctj,
        "einvoiceStatus": einvoiceStatus,
    };
}

class Pradr {
    Addr addr;
    String ntr;

    Pradr({
        required this.addr,
        required this.ntr,
    });

    factory Pradr.fromJson(Map<String, dynamic> json) => Pradr(
        addr: Addr.fromJson(json["addr"]),
        ntr: json["ntr"],
    );

    Map<String, dynamic> toJson() => {
        "addr": addr.toJson(),
        "ntr": ntr,
    };
}

class Addr {
    String bnm;
    String st;
    String loc;
    String bno;
    String dst;
    String lt;
    String locality;
    String pncd;
    String landMark;
    String stcd;
    String geocodelvl;
    String flno;
    String lg;

    Addr({
        required this.bnm,
        required this.st,
        required this.loc,
        required this.bno,
        required this.dst,
        required this.lt,
        required this.locality,
        required this.pncd,
        required this.landMark,
        required this.stcd,
        required this.geocodelvl,
        required this.flno,
        required this.lg,
    });

    factory Addr.fromJson(Map<String, dynamic> json) => Addr(
        bnm: json["bnm"],
        st: json["st"],
        loc: json["loc"],
        bno: json["bno"],
        dst: json["dst"],
        lt: json["lt"],
        locality: json["locality"],
        pncd: json["pncd"],
        landMark: json["landMark"],
        stcd: json["stcd"],
        geocodelvl: json["geocodelvl"],
        flno: json["flno"],
        lg: json["lg"],
    );

    Map<String, dynamic> toJson() => {
        "bnm": bnm,
        "st": st,
        "loc": loc,
        "bno": bno,
        "dst": dst,
        "lt": lt,
        "locality": locality,
        "pncd": pncd,
        "landMark": landMark,
        "stcd": stcd,
        "geocodelvl": geocodelvl,
        "flno": flno,
        "lg": lg,
    };
}
  