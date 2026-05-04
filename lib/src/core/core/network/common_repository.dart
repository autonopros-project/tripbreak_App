// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tripBreak/src/core/core/utils/extension.dart';

import '../../../../common_imports.dart';
import '../constants/constant_text.dart';
import '../utils/print.dart';

part 'crud_api_call_func.dart';

/// Enum for API types
enum APITypes { put, post, get, delete }

class ApiCalling {
  //?TO CALL API IN REPOSITORY
  static Future<HTTPResponse<dynamic>> callApi({
    required APITypes apiFunType,
    required String apiUrl,
    Map<String?, dynamic>? sendingData,
    bool isLoading = true,
  }) async {
    if (isLoading) {
      EasyLoading.show(status: Constants.loading);
    }
    dynamic data;
    try {
      Uri finalURL = Uri.parse(apiUrl);
      final http.Response response = await _detectApiType(
        apiFunType: apiFunType,
        url: finalURL,
        data: jsonEncode(sendingData),
      );

      // printDebug(
      //     " ~~ ${apiFunType.name.allInCaps} API CALL  ~~  ${response.statusCode}  ~~~  \n$finalURL");

      // printDebug(
      //     " ~~ ${apiFunType.name.allInCaps} API CALL  ~~  ${response.statusCode}  ~~~ \n$finalURL");

      // printDebug('reponse is \n${response.body}');

      printDebug(
          "${response.statusCode} & ${apiFunType.name.allInCaps} API CALL  ~~   $finalURL \n~~~ SENDING DATA\n${jsonEncode(sendingData)}\n ******RESPONSE BODY \n${response.body} ");

      // printDebug(
      //     "${apiFunType.name.allInCaps} API CALL  ~~  ${response.statusCode} ~~ $finalURL ~~~${apiFunType == APITypes.post ? response.body : ''} ");

      data = jsonDecode(response.body);

      // if (data['login'] == 0 &&
      //     response.statusCode == 200 &&
      //     data['message'] == "Invalid Token") {
      //   EasyLoading.dismiss();
      //   await EasyLoading.showInfo("Multiple Device Login Detected");
      //   NavigateRoutes.navigateToLoginScreen(isLogoutTap: true);
      //   return HTTPResponse<dynamic>(data, data['message'], 101);
      // } else

      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        return HTTPResponse<dynamic>(data, '', response.statusCode);
      } else {
        await EasyLoading.showInfo(data['message'] ??
            ConstantMessage.somethingWentWrongPleaseTryAgain);
        return HTTPResponse<dynamic>(data, '', response.statusCode);
      }
    } on SocketException {
      await EasyLoading.showInfo(ConstantMessage.noInternet);
      return HTTPResponse<dynamic>(data, ConstantMessage.noInternet, 403);
    } on FormatException {
      await EasyLoading.showInfo(ConstantMessage.invalidResponse);
      return HTTPResponse<dynamic>(data, ConstantMessage.invalidResponse, 504);
    } on Exception {
      await EasyLoading.showInfo(
          ConstantMessage.somethingWentWrongPleaseTryAgain);
      return HTTPResponse<dynamic>(
          data, ConstantMessage.somethingWentWrongPleaseTryAgain, 404);
    }
  }

//?TO DETECT API TYPE
  static Future<http.Response> _detectApiType({
    required APITypes apiFunType,
    required Uri url,

    // ignore: always_specify_types
    data,
  }) async {
    switch (apiFunType) {
      case APITypes.post:
        return await _ApiCallTypes.postRequestAPI(url: url, data: data);
      case APITypes.get:
        return await _ApiCallTypes.getRequestApi(url: url);
      case APITypes.put:
        return await _ApiCallTypes.putRequestApi(url: url, updatedData: data);
      case APITypes.delete:
        return await _ApiCallTypes.deleteRequestAPI(url: url);
    }
  }
}

//?FOR SUCCESSFUL RESPONSE FROM API
class HTTPResponse<T> {
  dynamic body;
  String? message;
  int? statusCode;

  HTTPResponse(this.body, this.message, this.statusCode);
}
