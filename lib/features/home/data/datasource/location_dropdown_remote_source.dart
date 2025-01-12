import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:jamat_app/core/api/api_constants.dart';
import 'package:jamat_app/core/api/executor.dart';
import 'package:jamat_app/core/api/parameter.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/request_model/mosque_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/location_dropdown_response_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_dropdown_response_model.dart';

abstract class LocationDropdownRemote with Executor {
  Future<LocationDropdownResponseModel> locationDropdown(
      LocationDropdownRequestModel model);
}

@Injectable(as: LocationDropdownRemote)
class LocationDropdownRemoteImpl extends LocationDropdownRemote {
  @override
  Future<LocationDropdownResponseModel> locationDropdown(
      LocationDropdownRequestModel model) async {
    log("enter into location dropdown remote");

    final response = await executePostRequest(
      RequestParam(
        ApiConstants.getLocationDropdownUrl,
        bodyParam: model.toJson(),
      ),
    );

    final decodedJson = json.decode(response.body);

    if (decodedJson['code'] == 200) {
      log("enter into code 200");
      
      return LocationDropdownResponseModel.fromJson(decodedJson);
    } else {
      throw ServerException(
        message: decodedJson['message'],
        statusCode: decodedJson['code'],
      );
    }
  }
}
