class MyModel {
  int itemGroup;
  String title;
  String saleCertificate;
  String unit;
  String colour;
  String vehicleGroup;
  String ledgerGroup;
  String labourGroup;
  String serviceType;
  String source;
  String destination;
  String department;
  String state;
  String bankMode;
  String category;
  String dealerCategory;

  MyModel({
    required this.itemGroup,
    required this.title,
    required this.saleCertificate,
    required this.unit,
    required this.colour,
    required this.vehicleGroup,
    required this.ledgerGroup,
    required this.labourGroup,
    required this.serviceType,
    required this.source,
    required this.destination,
    required this.department,
    required this.state,
    required this.bankMode,
    required this.category,
    required this.dealerCategory,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      itemGroup: json['ItemGroup'],
      title: json['Title'],
      saleCertificate: json['SaleCertificate'],
      unit: json['Unit'],
      colour: json['Colour'],
      vehicleGroup: json['VehicleGroup'],
      ledgerGroup: json['LedgerGroup'],
      labourGroup: json['LabourGroup'],
      serviceType: json['ServiceType'],
      source: json['Source'],
      destination: json['Destination'],
      department: json['Department'],
      state: json['State'],
      bankMode: json['BankMode'],
      category: json['Category'],
      dealerCategory: json['DealerCategory'],
    );
  }
}

