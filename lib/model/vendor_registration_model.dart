import 'dart:convert';

VendorRegistrationModel vendorRegistrationModelFromJson(String str) =>
    VendorRegistrationModel.fromJson(json.decode(json.decode(str)));

String vendorRegistrationModelToJson(VendorRegistrationModel data) =>
    json.encode(data.toJson());

class VendorRegistrationModel {
  List<String> successMessage;
  List<dynamic> errorMessage;
  List<dynamic> warningMessage;
  VendorData data;
  bool isSuccess;
  int httpStatusCode;

  VendorRegistrationModel({
    required this.successMessage,
    required this.errorMessage,
    required this.warningMessage,
    required this.data,
    required this.isSuccess,
    required this.httpStatusCode,
  });

  factory VendorRegistrationModel.fromJson(Map<String, dynamic> json) =>
      VendorRegistrationModel(
        successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
        errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
        warningMessage:
            List<dynamic>.from(json["WarningMessage"].map((x) => x)),
        data: VendorData.fromJson(json["Data"][0]),
        isSuccess: json["IsSuccess"],
        httpStatusCode: json["HttpStatusCode"],
      );

  Map<String, dynamic> toJson() => {
        "SuccessMessage": List<dynamic>.from(successMessage.map((x) => x)),
        "ErrorMessage": List<dynamic>.from(errorMessage.map((x) => x)),
        "WarningMessage": List<dynamic>.from(warningMessage.map((x) => x)),
        "Data": data.toJson(),
        "IsSuccess": isSuccess,
        "HttpStatusCode": httpStatusCode,
      };
}

class VendorData {
  dynamic materialDetails;
  int  vendorId;
  String vendorName;
  String companyName;
  int countryId;
  dynamic countryName;
  int stateId;
  dynamic stateName;
  int cityId;
  dynamic cityName;
  dynamic address;
  String mobileNumber;
  String emailId;
  dynamic gst;
  dynamic sgst;
  dynamic cgst;
  dynamic igst;
  dynamic utgst;
  dynamic panNumber;
  dynamic profilePicture;
  String role;
  dynamic accountNumber;
  dynamic micr;
  int bankId;
  dynamic bankName;
  dynamic bankAddress;
  int accountTypeId;
  String accountType;
  dynamic accountHolderName;
  String token;

  VendorData({
    required this.materialDetails,
    required this.vendorId,
    required this.vendorName,
    required this.companyName,
    required this.countryId,
    required this.countryName,
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
    required this.address,
    required this.mobileNumber,
    required this.emailId,
    required this.gst,
    required this.sgst,
    required this.cgst,
    required this.igst,
    required this.utgst,
    required this.panNumber,
    required this.profilePicture,
    required this.role,
    required this.accountNumber,
    required this.micr,
    required this.bankId,
    required this.bankName,
    required this.bankAddress,
    required this.accountTypeId,
    required this.accountType,
    required this.accountHolderName,
    required this.token,
  });

  factory VendorData.fromJson(Map<String, dynamic> json) => VendorData(
        materialDetails: json["materialDetails"],
        vendorId: json["VendorId"],
        vendorName: json["VendorName"],
        companyName: json["CompanyName"],
        countryId: json["CountryId"],
        countryName: json["CountryName"],
        stateId: json["StateId"],
        stateName: json["StateName"],
        cityId: json["CityId"],
        cityName: json["CityName"],
        address: json["Address"],
        mobileNumber: json["MobileNumber"],
        emailId: json["EmailId"],
        gst: json["GST"],
        sgst: json["SGST"],
        cgst: json["CGST"],
        igst: json["IGST"],
        utgst: json["UTGST"],
        panNumber: json["PanNumber"],
        profilePicture: json["ProfilePicture"],
        role: json["Role"],
        accountNumber: json["AccountNumber"],
        micr: json["MICR"],
        bankId: json["BankId"],
        bankName: json["BankName"],
        bankAddress: json["BankAddress"],
        accountTypeId: json["AccountTypeId"],
        accountType: json["AccountType"],
        accountHolderName: json["AccountHolderName"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "materialDetails": materialDetails,
        "VendorId": vendorId,
        "VendorName": vendorName,
        "CompanyName": companyName,
        "CountryId": countryId,
        "CountryName": countryName,
        "StateId": stateId,
        "StateName": stateName,
        "CityId": cityId,
        "CityName": cityName,
        "Address": address,
        "MobileNumber": mobileNumber,
        "EmailId": emailId,
        "GST": gst,
        "SGST": sgst,
        "CGST": cgst,
        "IGST": igst,
        "UTGST": utgst,
        "PanNumber": panNumber,
        "ProfilePicture": profilePicture,
        "Role": role,
        "AccountNumber": accountNumber,
        "MICR": micr,
        "BankId": bankId,
        "BankName": bankName,
        "BankAddress": bankAddress,
        "AccountTypeId": accountTypeId,
        "AccountType": accountType,
        "AccountHolderName": accountHolderName,
        "Token": token,
      };
}

// To parse this JSON data, do

    // final vendorRegistrationModel = vendorRegistrationModelFromJson(jsonString);

// import 'dart:convert';

// VendorRegistrationModel vendorRegistrationModelFromJson(String str) =>
//     VendorRegistrationModel.fromJson(json.decode(json.decode(str)));

// String vendorRegistrationModelToJson(VendorRegistrationModel data) =>
//     json.encode(data.toJson());

// class VendorRegistrationModel {
//   List<String> successMessage;
//   List<dynamic> errorMessage;
//   List<dynamic> warningMessage;
//   List<VendorData> data;
//   bool isSuccess;
//   int httpStatusCode;

//   VendorRegistrationModel({
//     required this.successMessage,
//     required this.errorMessage,
//     required this.warningMessage,
//     required this.data,
//     required this.isSuccess,
//     required this.httpStatusCode,
//   });

//   factory VendorRegistrationModel.fromJson(Map<String, dynamic> json) =>
//       VendorRegistrationModel(
//         successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
//         errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
//         warningMessage:
//             List<dynamic>.from(json["WarningMessage"].map((x) => x)),
//         data: List<VendorData>.from(json["Data"].map((x) => VendorData.fromJson(x))),
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

// class VendorData {
//   dynamic materialDetails;
//   int vendorId;
//   String vendorName;
//   String companyName;
//   int countryId;
//   dynamic countryName;
//   int stateId;
//   dynamic stateName;
//   int cityId;
//   dynamic cityName;
//   dynamic address;
//   String mobileNumber;
//   String emailId;
//   dynamic gst;
//   dynamic sgst;
//   dynamic cgst;
//   dynamic igst;
//   dynamic utgst;
//   dynamic panNumber;
//   dynamic profilePicture;
//   String role;
//   dynamic accountNumber;
//   dynamic micr;
//   int bankId;
//   dynamic bankName;
//   dynamic bankAddress;
//   int accountTypeId;
//   String accountType;
//   dynamic accountHolderName;
//   String token;

//   VendorData({
//     required this.materialDetails,
//     required this.vendorId,
//     required this.vendorName,
//     required this.companyName,
//     required this.countryId,
//     required this.countryName,
//     required this.stateId,
//     required this.stateName,
//     required this.cityId,
//     required this.cityName,
//     required this.address,
//     required this.mobileNumber,
//     required this.emailId,
//     required this.gst,
//     required this.sgst,
//     required this.cgst,
//     required this.igst,
//     required this.utgst,
//     required this.panNumber,
//     required this.profilePicture,
//     required this.role,
//     required this.accountNumber,
//     required this.micr,
//     required this.bankId,
//     required this.bankName,
//     required this.bankAddress,
//     required this.accountTypeId,
//     required this.accountType,
//     required this.accountHolderName,
//     required this.token,
//   });

//   factory VendorData.fromJson(Map<String, dynamic> json) => VendorData(
//         materialDetails: json["materialDetails"],
//         vendorId: json["VendorId"],
//         vendorName: json["VendorName"],
//         companyName: json["CompanyName"],
//         countryId: json["CountryId"],
//         countryName: json["CountryName"],
//         stateId: json["StateId"],
//         stateName: json["StateName"],
//         cityId: json["CityId"],
//         cityName: json["CityName"],
//         address: json["Address"],
//         mobileNumber: json["MobileNumber"],
//         emailId: json["EmailId"],
//         gst: json["GST"],
//         sgst: json["SGST"],
//         cgst: json["CGST"],
//         igst: json["IGST"],
//         utgst: json["UTGST"],
//         panNumber: json["PanNumber"],
//         profilePicture: json["ProfilePicture"],
//         role: json["Role"],
//         accountNumber: json["AccountNumber"],
//         micr: json["MICR"],
//         bankId: json["BankId"],
//         bankName: json["BankName"],
//         bankAddress: json["BankAddress"],
//         accountTypeId: json["AccountTypeId"],
//         accountType: json["AccountType"],
//         accountHolderName: json["AccountHolderName"],
//         token: json["Token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "materialDetails": materialDetails,
//         "VendorId": vendorId,
//         "VendorName": vendorName,
//         "CompanyName": companyName,
//         "CountryId": countryId,
//         "CountryName": countryName,
//         "StateId": stateId,
//         "StateName": stateName,
//         "CityId": cityId,
//         "CityName": cityName,
//         "Address": address,
//         "MobileNumber": mobileNumber,
//         "EmailId": emailId,
//         "GST": gst,
//         "SGST": sgst,
//         "CGST": cgst,
//         "IGST": igst,
//         "UTGST": utgst,
//         "PanNumber": panNumber,
//         "ProfilePicture": profilePicture,
//         "Role": role,
//         "AccountNumber": accountNumber,
//         "MICR": micr,
//         "BankId": bankId,
//         "BankName": bankName,
//         "BankAddress": bankAddress,
//         "AccountTypeId": accountTypeId,
//         "AccountType": accountType,
//         "AccountHolderName": accountHolderName,
//         "Token": token,
//       };
// }
