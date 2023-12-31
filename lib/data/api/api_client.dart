// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unused_field

import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseUrl;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json ;charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
   // print("Api Client $uri");
    try {
      Response response = await get(uri);
     // print("from uri  "+response.toString());
      return response;
    } catch (e) {
     // print("statusText: ${e.toString()}");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
