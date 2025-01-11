import 'dart:convert';

import 'env.dart';

class RequestParam {
  final _baseUrl =  AppUrl.getBaseURL();

  final String _pathSegment;

  final Map<String, dynamic>? _bodyParam;

  RequestParam(this._pathSegment, {Map<String, dynamic>? bodyParam}) : _bodyParam = bodyParam;

  String get endPoint => "$_baseUrl/$_pathSegment";

  // final authHeader = {
  //   "content-type": "application/json",
  //   "accept": "application/json",
  //   "request-source": "policyholder-app",
  //   "authorization": "Bearer ${sl<TokenSource>().getAccessToken()}",
  // };


  final header = {
    "content-type": "application/json",
    // "accept": "application/json",
  };

  String body() {
    return json.encode(_bodyParam);
  }
}