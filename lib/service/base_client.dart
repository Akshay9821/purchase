import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:purchase/common/constant.dart';
import 'package:purchase/service/app_exception.dart';

class BaseClient {
  // Get Request without Authentication
  static Future<dynamic> getRequestWithoutAuthentication(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          // "apiKey": Constant.apiKey,
          "apikey": Constant.apiKey
        },
      ).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("Please check your internet connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Please check your internet connection");
    }
  }

  // Post Request without Authentication
  static Future<dynamic> postRequestWithoutAuthentication(
      String url, dynamic payload) async {
    print(payload);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.staticStorage.read("token")}",
        },
      ).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("Please check your internet connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Please check your internet connection");
    }
  }

  // Get Request with Authentication
  static Future<dynamic> getRequestWithAuthentication(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.staticStorage.read("token")}",
          // "Authorization":
          //     "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidGVzdCBnaG9ma2pqaiIsIm5hbWVpZCI6IjkiLCJlbWFpbCI6ImFiaGlzaGVqQGdtYWlsLnhvbiIsInR5cCI6IlBNQyIsIm5iZiI6MTY5ODg5OTc5MSwiZXhwIjoxNzMwNTIyMTkxLCJpYXQiOjE2OTg4OTk3OTEsImlzcyI6Iklzc3VlciIsImF1ZCI6IkF1ZGllbmNlIn0.aKn7ZX6WttdCnICawflJWO0Yq31odtvuS2kMcGU66qzksSVC7kQuQn76N5Pnr3Ic-HO7weum5_kKNIDnhWJGFg",
        },
      ).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("Please check your internet connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Please check your internet connectiong");
    }
  }

  static Future<dynamic> getRequestWithAuthentication2(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          // "Authorization": "Bearer ${Constant.staticStorage.read("token")}",
          "Authorization":
              "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidGVzdCBnaG9ma2pqaiIsIm5hbWVpZCI6IjkiLCJlbWFpbCI6ImFiaGlzaGVqQGdtYWlsLnhvbiIsInR5cCI6IlBNQyIsIm5iZiI6MTY5ODg5OTc5MSwiZXhwIjoxNzMwNTIyMTkxLCJpYXQiOjE2OTg4OTk3OTEsImlzcyI6Iklzc3VlciIsImF1ZCI6IkF1ZGllbmNlIn0.aKn7ZX6WttdCnICawflJWO0Yq31odtvuS2kMcGU66qzksSVC7kQuQn76N5Pnr3Ic-HO7weum5_kKNIDnhWJGFg",
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  // Post Request with Authentication
  static Future<dynamic> postRequestWithAuthentication(
      String url, dynamic payload) async {
    print(Constant.staticStorage.read("token"));

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.staticStorage.read("token")}",
        },
      ).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("Please check your internet connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Please check your internet connection");
    }
  }

  // Delete Request With Authentication
  // Delete Request With Authentication
  static Future<dynamic> deleteRequestWithAuthentication(String url) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey":
              "bd1a1ccf8095037f361a4d351e7c0de65f0776bfc2f478ea8d312c763bb6caca",
          // "Authorization": "Bearer ${Constant.staticStorage.read("token")}",
          "Authorization":
              "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidGVzdCBnaG9ma2pqaiIsIm5hbWVpZCI6IjkiLCJlbWFpbCI6ImFiaGlzaGVqQGdtYWlsLnhvbiIsInR5cCI6IlBNQyIsIm5iZiI6MTY5ODg5OTc5MSwiZXhwIjoxNzMwNTIyMTkxLCJpYXQiOjE2OTg4OTk3OTEsImlzcyI6Iklzc3VlciIsImF1ZCI6IkF1ZGllbmNlIn0.aKn7ZX6WttdCnICawflJWO0Yq31odtvuS2kMcGU66qzksSVC7kQuQn76N5Pnr3Ic-HO7weum5_kKNIDnhWJGFg",
        },
      ).timeout(const Duration(seconds: 10));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("Please check your internet connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Please check your internet connection");
    }
  }

  static dynamic _processResponse(http.Response response) {
    print('${response.body}');
    print('${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException("Bad request. Internal server error");
      case 401:
        throw UnauthorizedException("Unauthorized user");
      case 500:
        throw UnauthorizedException("Internal server error");
      default:
        throw FetchDataException("Internal server error");
    }
  }

  static String validateResponse(dynamic response) {
    if (response["IsSuccess"]) {
      return "1";
    } else {
      if (response["ErrorMessage"].isEmpty) {
        return response["WarningMessage"][0];
      } else {
        return response["ErrorMessage"][0];
      }
    }
  }
}
