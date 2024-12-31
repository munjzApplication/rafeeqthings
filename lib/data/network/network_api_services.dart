import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_operations/data/exception/app_exceptions.dart';
import 'package:bloc_operations/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic jsonResponse;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(" ");
    } on TimeoutException {
      throw RequestTimeOutException("Time out Try again");
    }
    return jsonResponse;
  }

  @override
  Future postApi(String url, data) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(" ");
    } on TimeoutException {
      throw RequestTimeOutException("Time out Try again");
    }
    return jsonResponse;
  }

  @override
  Future deleteApi(String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(" ");
    } on TimeoutException {
      throw RequestTimeOutException("Time out Try again");
    }
    return jsonResponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      // 200 OK: Successful request
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      // 400 Bad Request: Invalid request sent by the client.
      throw BadRequestException("Bad Request: ${response.body}");

    case 401:
      // 401 Unauthorized: Authentication is required or has failed.
      throw UnauthorizedException("Unauthorized: ${response.body}");

    case 403:
      // 403 Forbidden: Access is not allowed.
      throw UnauthorizedException("Forbidden: ${response.body}");

    case 404:
      // 404 Not Found: Resource not found.
      throw FetchDataException("Not Found: ${response.body}");

    case 500:
      // 500 Internal Server Error: Server encountered an error.
      throw FetchDataException("Internal Server Error: ${response.body}");

    case 502:
      // 502 Bad Gateway: Invalid response from an upstream server.
      throw FetchDataException("Bad Gateway: ${response.body}");

    case 503:
      // 503 Service Unavailable: Server is temporarily unavailable.
      throw FetchDataException("Service Unavailable: ${response.body}");

    default:
      // Handle unexpected HTTP status codes
      throw FetchDataException(
          "Unexpected Error: Status Code ${response.statusCode}, Body: ${response.body}");
  }
}
