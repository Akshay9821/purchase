class MaterialModel {
  String materialName;
  // String zAttributesIdMaterialName;
  int masterMasterNameId;
  String subMaterialName;
  // String zAttributesIdSubMaterialName;
  int subMasterMasterNameId;
  String qty;
  String materialRemarks;

  MaterialModel(
      {required this.materialName,
      // required this.zAttributesIdMaterialName,
      required this.masterMasterNameId,
      required this.subMaterialName,
      // required this.zAttributesIdSubMaterialName,
      required this.subMasterMasterNameId,
      required this.qty,
      required this.materialRemarks});

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
        materialName: json['materialName'],
        // zAttributesIdMaterialName: json["zAttributesIdMaterialName"],
        masterMasterNameId: json["MaterialMasterId"],
        subMaterialName: json['subMaterialName'],
        // zAttributesIdSubMaterialName: json["zAttributesIdSubMaterialName"],
        subMasterMasterNameId: json["MaterialSubtypeMasterId"],
        qty: json['qty'],
        materialRemarks: json['materialRemarks'],
      );

  Map<String, dynamic> toJson() => {
        'materialName': materialName,
        // 'zAttributesIdMaterialName': zAttributesIdMaterialName,
        'MaterialMasterId': masterMasterNameId,
        'subMaterialName': subMaterialName,
        // 'zAttributesIdSubMaterialName': zAttributesIdSubMaterialName,
        'MaterialSubtypeMasterId': subMasterMasterNameId,
        'qty': qty,
        'materialRemarks': materialRemarks
      };
}
