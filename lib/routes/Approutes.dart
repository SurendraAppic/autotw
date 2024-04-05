// ignore_for_file: unused_import
import 'package:autowheelapp/Report/BillReport.dart';
import 'package:autowheelapp/Report/SaleReport.dart';
import 'package:autowheelapp/account/Controvochur.dart';
import 'package:autowheelapp/account/ExpenseScreen.dart';
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/account/PaymentScreen.dart';
import 'package:autowheelapp/labour/Estimateparts.dart';

import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Intro/Login_screen.dart';
import 'package:autowheelapp/screen/Intro/OtpScreen.dart';
import 'package:autowheelapp/screen/Jobcard/JobCard.dart';
import 'package:autowheelapp/screen/Jobcard/Materilissu.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/screen/master/Searvicemaster.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const loginScreen = '/';
  static const JobCardScreen = '/jobcardScreen';
  static const OtpScreen = '/OtpScreen';
  static const LoginScreen = '/LoginScreen';
  static const HomePageScreen = '/HomePageScreen';
  static const InvoiveScreen = '/InvoiveScreen';
  static const EstmatepartsScreen = '/EstmatepartsScreen';
  static const MaterialissuScreen = '/MaterialissuScreen';
  static const SearvicemasterScreen = '/SearvicemasterScreen';
  static const LedgerScreen = '/SearvicemasterScreen';
  static const PurchaseInvoiceScreen = '/PurchaseInvoiceScreen';
  static const billReoprtScreen = '/billReoprtScreen';
  static const ControlVoucharScreen = '/ControlVoucharScreen';
  static const ReportScreen = '/ReportScreen';
  static const ExpenseScreen = '/ExpenseScreen';
  static const PaymentScreen = '/ExpenseScreen';
  static const JobcardLabourscreen = '/JobcardLabourscreen';
}

class PageRoutes {
  static appRoutes() => [
        GetPage(name: AppRoutes.JobCardScreen, page: () => JobCardScreen()),
        GetPage(
            name: AppRoutes.OtpScreen,
            page: () => OtpScreen(
                  phoneNumber: '',
                )),
        GetPage(name: AppRoutes.LoginScreen, page: () => LoginScreen()),
        GetPage(name: AppRoutes.HomePageScreen, page: () => HomePageScreen()),
        GetPage(
            name: AppRoutes.InvoiveScreen,
            page: () => InvoiveScreen(value: true)),
        GetPage(
            name: AppRoutes.MaterialissuScreen,
            page: () => MaterialissuScreen()),
        GetPage(
            name: AppRoutes.SearvicemasterScreen,
            page: () => SearvicemasterScreen()),
        GetPage(name: AppRoutes.LedgerScreen, page: () => LedgerScreen()),
        GetPage(
            name: AppRoutes.PurchaseInvoiceScreen,
            page: () => PurchaseInvoiceScreen()),
        GetPage(
            name: AppRoutes.billReoprtScreen, page: () => billReoprtScreen()),
        GetPage(
            name: AppRoutes.ControlVoucharScreen,
            page: () => ControlVoucharScreen()),
        GetPage(name: AppRoutes.ReportScreen, page: () => ReportScreen()),
        GetPage(name: AppRoutes.ExpenseScreen, page: () => ExpenseScreen()),
        GetPage(name: AppRoutes.PaymentScreen, page: () => PaymentScreen()),
        // GetPage(
        //     name: AppRoutes.JobcardLabourscreen,
        //     page: () => AddLabour()),
      ];
}
