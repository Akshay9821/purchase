// import 'dart:convert';

// IndendResponseModel indendResponseModelFromJson(String str) =>
//     IndendResponseModel.fromJson(json.decode(json.decode(str)));

// String indendResponseModelToJson(IndendResponseModel data) =>
//     json.encode(data.toJson());

// class IndendResponseModel {
//   List<String> successMessage;
//   List<dynamic> errorMessage;
//   List<dynamic> warningMessage;
//   List<ViewIndendData> data;
//   bool isSuccess;
//   int httpStatusCode;

//   IndendResponseModel({
//     required this.successMessage,
//     required this.errorMessage,
//     required this.warningMessage,
//     required this.data,
//     required this.isSuccess,
//     required this.httpStatusCode,
//   });

//   factory IndendResponseModel.fromJson(Map<String, dynamic> json) =>
//       IndendResponseModel(
//         successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
//         errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
//         warningMessage:
//             List<dynamic>.from(json["WarningMessage"].map((x) => x)),
//         data: List<ViewIndendData>.from(
//             json["Data"].map((x) => ViewIndendData.fromJson(x))),
//         isSuccess: json["IsSuccess"],
//         httpStatusCode: json["HttpStatusCode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "SuccessMessage": List<dynamic>.from(successMessage.map((x) => x)),
//         "ErrorMessage": List<dynamic>.from(errorMessage.map((x) => x)),
//         "WarningMessage": List<dynamic>.from(warningMessage.map((x) => x)),
//         "Data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "IsSuccess": isSuccess,
//         "HttpStatusCode": httpStatusCode,
//       };
// }

// class ViewIndendData {
//   List<IndentMaterial> indentMaterial;
//   int indentId;
//   int companyId;
//   String companyName;
//   int projectId;
//   String? projectName;
//   String? projectLocation;
//   String remark;
//   DateTime requiredDate;
//   int createdById;
//   dynamic createdBy;
//   DateTime createdDate;
//   int modifiedById;
//   dynamic modifiedBy;
//   DateTime modifiedDate;

//   ViewIndendData({
//     required this.indentMaterial,
//     required this.indentId,
//     required this.companyId,
//     required this.companyName,
//     required this.projectId,
//     required this.projectName,
//     required this.projectLocation,
//     required this.remark,
//     required this.requiredDate,
//     required this.createdById,
//     required this.createdBy,
//     required this.createdDate,
//     required this.modifiedById,
//     required this.modifiedBy,
//     required this.modifiedDate,
//   });

//   factory ViewIndendData.fromJson(Map<String, dynamic> json) => ViewIndendData(
//         indentMaterial: List<IndentMaterial>.from(
//             json["indentMaterial"].map((x) => IndentMaterial.fromJson(x))),
//         indentId: json["IndentId"],
//         companyId: json["CompanyId"],
//         companyName: json["CompanyName"],
//         projectId: json["ProjectId"],
//         projectName: json["ProjectName"],
//         projectLocation: json["ProjectLocation"],
//         remark: json["Remark"],
//         requiredDate: DateTime.parse(json["RequiredDate"]),
//         createdById: json["CreatedById"],
//         createdBy: json["CreatedBy"],
//         createdDate: DateTime.parse(json["CreatedDate"]),
//         modifiedById: json["ModifiedById"],
//         modifiedBy: json["ModifiedBy"],
//         modifiedDate: DateTime.parse(json["ModifiedDate"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "indentMaterial":
//             List<dynamic>.from(indentMaterial.map((x) => x.toJson())),
//         "IndentId": indentId,
//         "CompanyId": companyId,
//         "CompanyName": companyName,
//         "ProjectId": projectId,
//         "ProjectName": projectName,
//         "ProjectLocation": projectLocation,
//         "Remark": remark,
//         "RequiredDate": requiredDate.toIso8601String(),
//         "CreatedById": createdById,
//         "CreatedBy": createdBy,
//         "CreatedDate": createdDate.toIso8601String(),
//         "ModifiedById": modifiedById,
//         "ModifiedBy": modifiedBy,
//         "ModifiedDate": modifiedDate.toIso8601String(),
//       };
// }

// class IndentMaterial {
//   int indentMaterialId;
//   int materialId;
//   String materialName;
//   int materialSubTypeMasterId;
//   String materialSubtypeName;
//   String uomCode;
//   double quantity;
//   String materialRemark;

//   IndentMaterial({
//     required this.indentMaterialId,
//     required this.materialId,
//     required this.materialName,
//     required this.materialSubTypeMasterId,
//     required this.materialSubtypeName,
//     required this.uomCode,
//     required this.quantity,
//     required this.materialRemark,
//   });

//   factory IndentMaterial.fromJson(Map<String, dynamic> json) => IndentMaterial(
//         indentMaterialId: json["IndentMaterialId"],
//         materialId: json["MaterialId"],
//         materialName: json["MaterialName"],
//         materialSubTypeMasterId: json["MaterialSubTypeMasterId"],
//         materialSubtypeName: json["MaterialSubtypeName"],
//         uomCode: json["UOMCode"],
//         quantity: json["Quantity"],
//         materialRemark: json["MaterialRemark"],
//       );

//   Map<String, dynamic> toJson() => {
//         "IndentMaterialId": indentMaterialId,
//         "MaterialId": materialId,
//         "MaterialName": materialName,
//         "MaterialSubTypeMasterId": materialSubTypeMasterId,
//         "MaterialSubtypeName": materialSubtypeName,
//         "UOMCode": uomCode,
//         "Quantity": quantity,
//         "MaterialRemark": materialRemark,
//       };
// }

// To parse this JSON data, do
//
//     final indendResponseModel = indendResponseModelFromJson(jsonString);

import 'dart:convert';

IndendResponseModel indendResponseModelFromJson(String str) =>
    IndendResponseModel.fromJson(json.decode(json.decode(str)));

String indendResponseModelToJson(IndendResponseModel data) =>
    json.encode(data.toJson());

class IndendResponseModel {
  List<String> successMessage;
  List<dynamic> errorMessage;
  List<dynamic> warningMessage;
  List<ViewIndendData> data;
  bool isSuccess;
  int httpStatusCode;

  IndendResponseModel({
    required this.successMessage,
    required this.errorMessage,
    required this.warningMessage,
    required this.data,
    required this.isSuccess,
    required this.httpStatusCode,
  });

  factory IndendResponseModel.fromJson(Map<String, dynamic> json) =>
      IndendResponseModel(
        successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
        errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
        warningMessage:
            List<dynamic>.from(json["WarningMessage"].map((x) => x)),
        data: List<ViewIndendData>.from(
            json["Data"].map((x) => ViewIndendData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        httpStatusCode: json["HttpStatusCode"],
      );

  Map<String, dynamic> toJson() => {
        "SuccessMessage": List<dynamic>.from(successMessage.map((x) => x)),
        "ErrorMessage": List<dynamic>.from(errorMessage.map((x) => x)),
        "WarningMessage": List<dynamic>.from(warningMessage.map((x) => x)),
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "HttpStatusCode": httpStatusCode,
      };
}

class ViewIndendData {
  List<IndentMaterial> indentMaterial;
  int indentId;
  int companyId;
  String companyName;
  int projectId;
  String projectName;
  String projectLocation;
  String remark;
  DateTime requiredDate;
  int createdById;
  String createdBy;
  DateTime createdDate;
  int modifiedById;
  dynamic modifiedBy;
  DateTime modifiedDate;
  int statusId;
  String status;
  int nextIndentActionId;
  String? nextIndentAction;
  int mdId;
  String? mdName;
  String? mdMobileNumber;
  String? mdemail;
  int hodId;
  String? hodName;
  String? hodMobileNumber;
  String? hodEmail;
  int siteSupervisorId;
  String? siteSupervisorName;
  String? siteSupervisorMobileNumber;
  String? siteSupervisorEmail;
  int siteEngineerId;
  String? siteEngineerName;
  String? siteEngineerMobileNumber;
  String? siteEngineerEmail;

  ViewIndendData({
    required this.indentMaterial,
    required this.indentId,
    required this.companyId,
    required this.companyName,
    required this.projectId,
    required this.projectName,
    required this.projectLocation,
    required this.remark,
    required this.requiredDate,
    required this.createdById,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedById,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.statusId,
    required this.status,
    required this.nextIndentActionId,
    required this.nextIndentAction,
    required this.mdId,
    required this.mdName,
    required this.mdMobileNumber,
    required this.mdemail,
    required this.hodId,
    required this.hodName,
    required this.hodMobileNumber,
    required this.hodEmail,
    required this.siteSupervisorId,
    required this.siteSupervisorName,
    required this.siteSupervisorMobileNumber,
    required this.siteSupervisorEmail,
    required this.siteEngineerId,
    required this.siteEngineerName,
    required this.siteEngineerMobileNumber,
    required this.siteEngineerEmail,
  });

  factory ViewIndendData.fromJson(Map<String, dynamic> json) => ViewIndendData(
        indentMaterial: List<IndentMaterial>.from(
            json["indentMaterial"].map((x) => IndentMaterial.fromJson(x))),
        indentId: json["IndentId"],
        companyId: json["CompanyId"],
        companyName: json["CompanyName"],
        projectId: json["ProjectId"],
        projectName: json["ProjectName"],
        projectLocation: json["ProjectLocation"],
        remark: json["Remark"],
        requiredDate: DateTime.parse(json["RequiredDate"]),
        createdById: json["CreatedById"],
        createdBy: json["CreatedBy"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        modifiedById: json["ModifiedById"],
        modifiedBy: json["ModifiedBy"],
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        statusId: json["StatusId"],
        status: json["Status"],
        nextIndentActionId: json["NextIndentActionId"],
        nextIndentAction: json["NextIndentAction"],
        mdId: json["MDId"],
        mdName: json["MDName"],
        mdMobileNumber: json["MDMobileNumber"],
        mdemail: json["MDEMAIL"],
        hodId: json["HodId"],
        hodName: json["HodName"],
        hodMobileNumber: json["HodMobileNumber"],
        hodEmail: json["HodEMAIL"],
        siteSupervisorId: json["SiteSupervisorId"],
        siteSupervisorName: json["SiteSupervisorName"],
        siteSupervisorMobileNumber: json["SiteSupervisorMobileNumber"],
        siteSupervisorEmail: json["SiteSupervisorEmail"],
        siteEngineerId: json["SiteEngineerId"],
        siteEngineerName: json["SiteEngineerName"],
        siteEngineerMobileNumber: json["SiteEngineerMobileNumber"],
        siteEngineerEmail: json["SiteEngineerEMAIL"],
      );

  Map<String, dynamic> toJson() => {
        "indentMaterial":
            List<dynamic>.from(indentMaterial.map((x) => x.toJson())),
        "IndentId": indentId,
        "CompanyId": companyId,
        "CompanyName": companyName,
        "ProjectId": projectId,
        "ProjectName": projectName,
        "ProjectLocation": projectLocation,
        "Remark": remark,
        "RequiredDate": requiredDate.toIso8601String(),
        "CreatedById": createdById,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate.toIso8601String(),
        "ModifiedById": modifiedById,
        "ModifiedBy": modifiedBy,
        "ModifiedDate": modifiedDate.toIso8601String(),
        "StatusId": statusId,
        "Status": status,
        "NextIndentActionId": nextIndentActionId,
        "NextIndentAction": nextIndentAction,
        "MDId": mdId,
        "MDName": mdName,
        "MDMobileNumber": mdMobileNumber,
        "MDEMAIL": mdemail,
        "HodId": hodId,
        "HodName": hodName,
        "HodMobileNumber": hodMobileNumber,
        "HodEMAIL": hodEmail,
        "SiteSupervisorId": siteSupervisorId,
        "SiteSupervisorName": siteSupervisorName,
        "SiteSupervisorMobileNumber": siteSupervisorMobileNumber,
        "SiteSupervisorEmail": siteSupervisorEmail,
        "SiteEngineerId": siteEngineerId,
        "SiteEngineerName": siteEngineerName,
        "SiteEngineerMobileNumber": siteEngineerMobileNumber,
        "SiteEngineerEMAIL": siteEngineerEmail,
      };
}

class IndentMaterial {
  int indentMaterialId;
  int materialId;
  String materialName;
  int materialSubTypeMasterId;
  String materialSubtypeName;
  String uomCode;
  double quantity;
  String materialRemark;

  IndentMaterial({
    required this.indentMaterialId,
    required this.materialId,
    required this.materialName,
    required this.materialSubTypeMasterId,
    required this.materialSubtypeName,
    required this.uomCode,
    required this.quantity,
    required this.materialRemark,
  });

  factory IndentMaterial.fromJson(Map<String, dynamic> json) => IndentMaterial(
        indentMaterialId: json["IndentMaterialId"],
        materialId: json["MaterialId"],
        materialName: json["MaterialName"],
        materialSubTypeMasterId: json["MaterialSubTypeMasterId"],
        materialSubtypeName: json["MaterialSubtypeName"],
        uomCode: json["UOMCode"],
        quantity: json["Quantity"],
        materialRemark: json["MaterialRemark"],
      );

  Map<String, dynamic> toJson() => {
        "IndentMaterialId": indentMaterialId,
        "MaterialId": materialId,
        "MaterialName": materialName,
        "MaterialSubTypeMasterId": materialSubTypeMasterId,
        "MaterialSubtypeName": materialSubtypeName,
        "UOMCode": uomCode,
        "Quantity": quantity,
        "MaterialRemark": materialRemark,
      };
}
