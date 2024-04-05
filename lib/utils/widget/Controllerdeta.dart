import 'package:get/get.dart';

class InvoiceController extends GetxController {
  final addlabourlist = [].obs;
  final addpartlist = [].obs;
  final purchessinvoic = [].obs;
  final jobcardlist = [].obs;
  final gstlist = [].obs;
  // RxDouble _totalSpare = 0.0.obs;
  // RxDouble _totalLabour = 0.0.obs;
  // RxDouble _totalGst = 0.0.obs;

  // double get totalSpare => _totalSpare.value;
  // double get totalLabour => _totalLabour.value;
  // double get totalGst => _totalGst.value;

  void addParts(double partPrice, double gst1) {
    addpartlist.add(partPrice);
    gstlist.add(gst1);
    // _totalSpare.value += partPrice;
    // var totalValue = _totalGst.value += gst1;

    // return totalValue;
  }

  void addLabor(double laborPrice, double gst) {
    addlabourlist.add(laborPrice);
    gstlist.add(gst);
    // _totalLabour.value += laborPrice;
    // _totalGst.value += gst;
  }

  // Calculate total parts cost manually
  double get totalParts => addpartlist.fold(0, (sum, item) => sum + item);

  // Calculate total labours cost manually
  double get totalLabours => addlabourlist.fold(0, (sum, item) => sum + item);
  double get totalGst => gstlist.fold(0, (sum, item) => sum + item);

  void clearValues() {
    addlabourlist.clear();
    addpartlist.clear();
    purchessinvoic.clear();
    addlabourlist.clear();
    gstlist.clear();
    // _totalSpare.value = 0.0;
    // _totalLabour.value = 0.0;
    // _totalGst.value = 0.0;
  }
}
