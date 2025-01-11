import 'dart:developer';

import 'package:http/http.dart' show Client, Response;

import 'parameter.dart';

mixin Executor {
  final _client = Client();

  // Future<Response> executeAuthPostRequest(RequestParam param) async {
  //   final resp = await _client.post(
  //     Uri.parse(param.endPoint),
  //     headers: param.authHeader,
  //     body: param.body(),
  //   );
  //   log("Request Body: ${param.body()}\nResponse: ${resp.body}", name: "URL: ${param.endPoint}");
  //   return resp;
  // }

  // Future<Response> executeAuthPutRequest(RequestParam param) async {
  //   final resp = await _client.put(
  //     Uri.parse(param.endPoint),
  //     headers: param.authHeader,
  //     body: param.body(),
  //   );
  //   log("Request Body: ${param.body()}\nResponse: ${resp.body}", name: "URL: ${param.endPoint}");
  //   return resp;
  // }

  // Future<Response> executeGetRequest(RequestParam param) async {
  //   final resp = await _client.get(
  //     Uri.parse(param.endPoint),
  //     headers: param.header,
  //   );
  //   log("Response: ${json.decode(resp.body)}", name: "URL: ${param.endPoint}");
  //   return resp;
  // }

  // Future<Response> executeGetRequestWithAuth(RequestParam param) async {
  //   final resp = await _client.get(
  //     Uri.parse(param.endPoint),
  //     headers: param.authHeader,
  //   );
  //   log("Response: ${resp.body}", name: "URL: ${param.endPoint}");
  //   return resp;
  // }

  Future<Response> executePostRequest(RequestParam param) async {
    final resp = await _client.post(
      Uri.parse(param.endPoint),
      headers: param.header,
      body: param.body(),
    );
    return resp;
  }
}
