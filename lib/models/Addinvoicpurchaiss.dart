class Item {
  int? itemId;
  String? itemName;
  String? itemDes;
  int? groupId;
  int? categoryId;
  int? manufacturerId;
  int? supplierId;
  int? unitId;
  int? locationId;
  String? wefDate;
  double ?mrp;
  double ?ndp;
  double ?discount;
  double ?gst;
  double ?orderQty;
  double ?margin;
  double ?openingStock;
  double ?stockQty;
  String? binNo;
  double ?salePrice;
  int? hsnId;
  String? hsnCode;
  String? igst;
  String? cgst;
  String? sgst;
  String? cess;
  String? alternPartNo;
  double ?minStock;
  double ?maxStock;
  double ?moq;
  double ?roi;
  int? partStatus;
  int? status;
  String? remarks;
  int? createdBy;
  String? createdDate;
  int? updateBy;
  String? updatedDate;

  Item({
     this.itemId,
     this.itemName,
     this.itemDes,
     this.groupId,
     this.categoryId,
     this.manufacturerId,
     this.supplierId,
     this.unitId,
     this.locationId,
     this.wefDate,
     this.mrp,
     this.ndp,
     this.discount,
     this.gst,
     this.orderQty,
     this.margin,
     this.openingStock,
     this.stockQty,
     this.binNo,
     this.salePrice,
     this.hsnId,
     this.hsnCode,
     this.igst,
     this.cgst,
     this.sgst,
     this.cess,
     this.alternPartNo,
     this.minStock,
     this.maxStock,
     this.moq,
     this.roi,
     this.partStatus,
     this.status,
     this.remarks,
     this.createdBy,
     this.createdDate,
     this.updateBy,
     this.updatedDate,
  });

  factory Item.fromJson(Map<String?, dynamic> json) {
    return Item(
      itemId: json['item_Id'],
      itemName: json['item_Name'],
      itemDes: json['item_Des'],
      groupId: json['group_Id'],
      categoryId: json['categoryId'],
      manufacturerId: json['manufacturer_Id'],
      supplierId: json['supplier_Id'],
      unitId: json['unit_Id'],
      locationId: json['location_Id'],
      wefDate: json['wef_Date'],
      mrp: json['mrp'].toDouble(),
      ndp: json['ndp'].toDouble(),
      discount: json['discount'].toDouble(),
      gst: json['gst'].toDouble(),
      orderQty: json['order_Qty'].toDouble(),
      margin: json['margin'].toDouble(),
      openingStock: json['opening_Stock'].toDouble(),
      stockQty: json['stock_Qty'].toDouble(),
      binNo: json['bin_No'],
      salePrice: json['sale_Price'].toDouble(),
      hsnId: json['hsn_Id'],
      hsnCode: json['hsn_Code'],
      igst: json['igst'],
      cgst: json['cgst'],
      sgst: json['sgst'],
      cess: json['cess'],
      alternPartNo: json['alternPartNo'],
      minStock: json['min_Stock'].toDouble(),
      maxStock: json['max_Stock'].toDouble(),
      moq: json['moq'].toDouble(),
      roi: json['roi'].toDouble(),
      partStatus: json['partStatus'],
      status: json['status'],
      remarks: json['remarks'],
      createdBy: json['createdBy'],
      createdDate: json['createdDate'],
      updateBy: json['updateBy'],
      updatedDate: json['updatedDate'],
    );
  }
}

class ItemLabour {
  int? itemId;
  String? itemName;
  String? itemDes;
  int? groupId;
  int? categoryId;
  int? manufacturerId;
  int? supplierId;
  int? unitId;
  int? locationId;
  String? wefDate;
  double ?mrp;
  double ?ndp;
  double ?discount;
  double ?gst;
  double ?orderQty;
  double ?margin;
  double ?openingStock;
  double ?stockQty;
  String? binNo;
  double ?salePrice;
  int? hsnId;
  String? hsnCode;
  String? igst;
  String? cgst;
  String? sgst;
  String? cess;
  String? alternPartNo;
  double ?minStock;
  double ?maxStock;
  double ?moq;
  double ?roi;
  int? partStatus;
  int? status;
  String? remarks;
  int? createdBy;
  String? createdDate;
  int? updateBy;
  String? updatedDate;

  ItemLabour({
     this.itemId,
     this.itemName,
     this.itemDes,
     this.groupId,
     this.categoryId,
     this.manufacturerId,
     this.supplierId,
     this.unitId,
     this.locationId,
     this.wefDate,
     this.mrp,
     this.ndp,
     this.discount,
     this.gst,
     this.orderQty,
     this.margin,
     this.openingStock,
     this.stockQty,
     this.binNo,
     this.salePrice,
     this.hsnId,
     this.hsnCode,
     this.igst,
     this.cgst,
     this.sgst,
     this.cess,
     this.alternPartNo,
     this.minStock,
     this.maxStock,
     this.moq,
     this.roi,
     this.partStatus,
     this.status,
     this.remarks,
     this.createdBy,
     this.createdDate,
     this.updateBy,
     this.updatedDate,
  });

  factory ItemLabour.fromJson(Map<String?, dynamic> json) {
    return ItemLabour(
      itemId: json['item_Id'],
      itemName: json['item_Name'],
      itemDes: json['item_Des'],
      groupId: json['group_Id'],
      categoryId: json['categoryId'],
      manufacturerId: json['manufacturer_Id'],
      supplierId: json['supplier_Id'],
      unitId: json['unit_Id'],
      locationId: json['location_Id'],
      wefDate: json['wef_Date'],
      mrp: json['mrp'].toDouble(),
      ndp: json['ndp'].toDouble(),
      discount: json['discount'].toDouble(),
      gst: json['gst'].toDouble(),
      orderQty: json['order_Qty'].toDouble(),
      margin: json['margin'].toDouble(),
      openingStock: json['opening_Stock'].toDouble(),
      stockQty: json['stock_Qty'].toDouble(),
      binNo: json['bin_No'],
      salePrice: json['sale_Price'].toDouble(),
      hsnId: json['hsn_Id'],
      hsnCode: json['hsn_Code'],
      igst: json['igst'],
      cgst: json['cgst'],
      sgst: json['sgst'],
      cess: json['cess'],
      alternPartNo: json['alternPartNo'],
      minStock: json['min_Stock'].toDouble(),
      maxStock: json['max_Stock'].toDouble(),
      moq: json['moq'].toDouble(),
      roi: json['roi'].toDouble(),
      partStatus: json['partStatus'],
      status: json['status'],
      remarks: json['remarks'],
      createdBy: json['createdBy'],
      createdDate: json['createdDate'],
      updateBy: json['updateBy'],
      updatedDate: json['updatedDate'],
    );
  }
}
