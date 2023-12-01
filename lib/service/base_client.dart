import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:purchase/common/constant.dart';
import 'package:purchase/service/app_exception.dart';

class BaseClient {
  static Future<dynamic> getRequestWithoutAuthentication(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  static Future<dynamic> getRequestWithAuthentication(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.token}",
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  // Post Request without Authentication
  static Future<dynamic> postRequestWithoutAuthentication(
      String url, dynamic payload) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  static Future<dynamic> getRequestWithAuthentication2(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${Constant.token}",
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
    print(url);
    print(payload);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(payload),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.token}",
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  // Delete Request With Authentication
  static Future<dynamic> deleteRequestWithAuthentication(String url) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "apiKey": Constant.apiKey,
          "Authorization": "Bearer ${Constant.token}",
        },
      ).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("API Not Responding");
    }
  }

  static dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException("Bad Request. Internal Server Error");
      case 500:
        throw UnauthorizedException("Unauthorized User");
      default:
        throw FetchDataException("Internal Server Error");
    }
  }
}
