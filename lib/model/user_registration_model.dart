// // To parse this JSON data, do
// //
// //     final userRegistrationModel = userRegistrationModelFromJson(jsonString);

// import 'dart:convert';

// UserRegistrationModel userRegistrationModelFromJson(String str) =>
//     UserRegistrationModel.fromJson(json.decode(json.decode(str)));

// String userRegistrationModelToJson(UserRegistrationModel data) =>
//     json.encode(data.toJson());

// class UserRegistrationModel {
//   List<String> successMessage;
//   List<dynamic> errorMessage;
//   List<dynamic> warningMessage;
//   UserData data;
//   bool isSuccess;
//   int httpStatusCode;

//   UserRegistrationModel({
//     required this.successMessage,
//     required this.errorMessage,
//     required this.warningMessage,
//     required this.data,
//     required this.isSuccess,
//     required this.httpStatusCode,
//   });

//   factory UserRegistrationModel.fromJson(Map<String, dynamic> json) =>
//       UserRegistrationModel(
//         successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
//         errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
//         warningMessage:
//             List<dynamic>.from(json["WarningMessage"].map((x) => x)),
//         data: UserData.fromJson(json["Data"][0]),
//         isSuccess: json["IsSuccess"],
//         httpStatusCode: json["HttpStatusCode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "SuccessMessage": List<dynamic>.from(successMessage.map((x) => x)),
//         "ErrorMessage": List<dynamic>.from(errorMessage.map((x) => x)),
//         "WarningMessage": List<dynamic>.from(warningMessage.map((x) => x)),
//         "Data": data,
//         "IsSuccess": isSuccess,
//         "HttpStatusCode": httpStatusCode,
//       };
// }

// class UserData {
//   int userDetailsId;
//   String userFirstName;
//   dynamic userMiddleName;
//   String userLastName;
//   String emailId;
//   String mobileNumber;
//   String role;
//   int roleId;
//   dynamic profilePicture;
//   dynamic lastLogin;
//   String token;

//   UserData({
//     required this.userDetailsId,
//     required this.userFirstName,
//     required this.userMiddleName,
//     required this.userLastName,
//     required this.emailId,
//     required this.mobileNumber,
//     required this.role,
//     required this.roleId,
//     required this.profilePicture,
//     required this.lastLogin,
//     required this.token,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         userDetailsId: json["UserDetailsId"],
//         userFirstName: json["UserFirstName"],
//         userMiddleName: json["UserMiddleName"],
//         userLastName: json["UserLastName"],
//         emailId: json["EmailId"],
//         mobileNumber: json["MobileNumber"],
//         role: json["Role"],
//         roleId: json["RoleId"],
//         profilePicture: json["ProfilePicture"],

//         lastLogin: json["LastLogin"],
//         token: json["Token"],
//       );

//   Map<String, dynamic> toJson() => {
//         "UserDetailsId": userDetailsId,
//         "UserFirstName": userFirstName,
//         "UserMiddleName": userMiddleName,
//         "UserLastName": userLastName,
//         "EmailId": emailId,
//         "MobileNumber": mobileNumber,
//         "Role": role,
//         "RoleId": roleId,
//         "ProfilePicture": profilePicture,

//         "LastLogin": lastLogin,
//         "Token": token,
//       };
// }

// To parse this JSON data, do
//
//     final userRegistrationModel = userRegistrationModelFromJson(jsonString);

import 'dart:convert';

UserRegistrationModel userRegistrationModelFromJson(String str) =>
    UserRegistrationModel.fromJson(json.decode(json.decode(str)));

String userRegistrationModelToJson(UserRegistrationModel data) =>
    json.encode(data.toJson());

class UserRegistrationModel {
  List<String> successMessage;
  List<dynamic> errorMessage;
  List<dynamic> warningMessage;
  UserData data;
  bool isSuccess;
  int httpStatusCode;

  UserRegistrationModel({
    required this.successMessage,
    required this.errorMessage,
    required this.warningMessage,
    required this.data,
    required this.isSuccess,
    required this.httpStatusCode,
  });

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) =>
      UserRegistrationModel(
        successMessage: List<String>.from(json["SuccessMessage"].map((x) => x)),
        errorMessage: List<dynamic>.from(json["ErrorMessage"].map((x) => x)),
        warningMessage:
            List<dynamic>.from(json["WarningMessage"].map((x) => x)),
        data: UserData.fromJson(json["Data"][0]),
        isSuccess: json["IsSuccess"],
        httpStatusCode: json["HttpStatusCode"],
      );

  Map<String, dynamic> toJson() => {
        "SuccessMessage": List<dynamic>.from(successMessage.map((x) => x)),
        "ErrorMessage": List<dynamic>.from(errorMessage.map((x) => x)),
        "WarningMessage": List<dynamic>.from(warningMessage.map((x) => x)),
        "Data": data,
        "IsSuccess": isSuccess,
        "HttpStatusCode": httpStatusCode,
      };
}

class UserData {
  List<CompanyDetail> companyDetails;
  int userDetailsId;
  String userFirstName;
  dynamic userMiddleName;
  String userLastName;
  String emailId;
  String mobileNumber;
  String role;
  int roleId;
  dynamic profilePicture;
  dynamic lastLogin;
  String token;

  UserData({
    required this.companyDetails,
    required this.userDetailsId,
    required this.userFirstName,
    required this.userMiddleName,
    required this.userLastName,
    required this.emailId,
    required this.mobileNumber,
    required this.role,
    required this.roleId,
    required this.profilePicture,
    required this.lastLogin,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        companyDetails: List<CompanyDetail>.from(
            json["CompanyDetails"].map((x) => CompanyDetail.fromJson(x))),
        userDetailsId: json["UserDetailsId"],
        userFirstName: json["UserFirstName"],
        userMiddleName: json["UserMiddleName"],
        userLastName: json["UserLastName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        role: json["Role"],
        roleId: json["RoleId"],
        profilePicture: json["ProfilePicture"],
        lastLogin: json["LastLogin"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyDetails":
            List<dynamic>.from(companyDetails.map((x) => x.toJson())),
        "UserDetailsId": userDetailsId,
        "UserFirstName": userFirstName,
        "UserMiddleName": userMiddleName,
        "UserLastName": userLastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Role": role,
        "RoleId": roleId,
        "ProfilePicture": profilePicture,
        "LastLogin": lastLogin,
        "Token": token,
      };
}

class CompanyDetail {
  int companyId;
  String companyName;
  int projectId;
  int projectRefCompanyId;
  String projectName;
  String projectLocation;

  CompanyDetail({
    required this.companyId,
    required this.companyName,
    required this.projectId,
    required this.projectRefCompanyId,
    required this.projectName,
    required this.projectLocation,
  });

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
        companyId: json["CompanyId"],
        companyName: json["CompanyName"],
        projectId: json["ProjectId"],
        projectRefCompanyId: json["ProjectRefCompanyId"],
        projectName: json["ProjectName"],
        projectLocation: json["ProjectLocation"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "CompanyName": companyName,
        "ProjectId": projectId,
        "ProjectRefCompanyId": projectRefCompanyId,
        "ProjectName": projectName,
        "ProjectLocation": projectLocation,
      };
}
