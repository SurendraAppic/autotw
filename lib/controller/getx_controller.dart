
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainController extends GetxController {
  var transactionData = TransactionData(igst: 0.0, net: 0.0, gross: 0.0).obs;

  // Function to update transaction data by adding new values to existing ones
  void updateTransactionData(TransactionData newData) {
    transactionData.update((val) {
      val!.igst += newData.igst;
      val.net += newData.net;
      val.gross += newData.gross;
    });
  }

  clearvalue() {
    TransactionData(igst: 0.0, net: 0.0, gross: 0.0);
  }
}

class TransactionData {
  double igst;
  double net;
  double gross;

  TransactionData({required this.igst, required this.net, required this.gross});
}

class InvoiceController5 extends GetxController {
  var parts = <double>[].obs;
  var labours = <double>[].obs;

  void addPart(double part) {
    parts.add(part);
  }

  void addLabour(double labour) {
    labours.add(labour);
  }

  // Calculate total parts cost manually
  double get totalParts => parts.fold(0, (sum, item) => sum + item);

  // Calculate total labours cost manually
  double get totalLabours => labours.fold(0, (sum, item) => sum + item);
}

class InvoiceScreenClass extends StatelessWidget {
  final InvoiceController5 controller = Get.put(InvoiceController5());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Invoice')),
      body: Column(
        children: [
          Obx(() => ListTile(
                title: Text('Total Parts Cost'),
                subtitle: Text('${controller.totalParts.toStringAsFixed(2)}'),
              )),
          Obx(() => ListTile(
                title: Text('Total Labour Cost'),
                subtitle: Text('${controller.totalLabours.toStringAsFixed(2)}'),
              )),
          ElevatedButton(
            onPressed: () => Get.to(() => AddPartScreen()),
            child: Text('Add Part'),
          ),
          ElevatedButton(
            onPressed: () => Get.to(() => AddLabourScreen()),
            child: Text('Add Labour'),
          ),
        ],
      ),
    );
  }
}

class AddPartScreen extends StatelessWidget {
  final InvoiceController5 controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController partController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Part")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: partController,
              decoration: InputDecoration(hintText: "Part Cost"),
              keyboardType: TextInputType.number, // Ensures numeric keyboard
            ),
            ElevatedButton(
              onPressed: () {
                double? cost = double.tryParse(partController.text);
                if (cost != null) {
                  controller.addPart(cost);
                  Get.back();
                } else {
                  // Handle error, maybe show a dialog/toast
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

class AddLabourScreen extends StatelessWidget {
  final InvoiceController5 controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController labourController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Labour")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: labourController,
              decoration: InputDecoration(hintText: "Labour Cost"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double? cost = double.tryParse(labourController.text);
                if (cost != null) {
                  controller.addLabour(cost);
                  Get.back();
                } else {
                  // Handle error
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
