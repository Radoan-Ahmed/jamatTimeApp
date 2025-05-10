import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:jamat_app/core/api/api_constants.dart';
import 'package:jamat_app/core/api/executor.dart';
import 'package:jamat_app/core/api/parameter.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/home/data/model/request_model/global_prayer_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/global_prayer_time_response_model.dart';

abstract class GlobalPrayerTimeRemote with Executor {
  Future<GlobalPrayerTimeResponseModel> globalPrayerTime(
      GlobalPrayerTimeRequestModel model);
}

@Injectable(as: GlobalPrayerTimeRemote)
class GlobalPrayerTimeRemoteImpl extends GlobalPrayerTimeRemote {
  @override
  Future<GlobalPrayerTimeResponseModel> globalPrayerTime(
      GlobalPrayerTimeRequestModel model) async {
    log("enter into mosque dropdown remote");

    final response = await executePostRequest(
      RequestParam(
        ApiConstants.getGlobalPrayerTimeUrl,
        bodyParam: model.toJson(),
      ),
    );

    log("the response is ${response.body}");

    final decodedJson = json.decode(response.body);

    log("the response data is ${decodedJson['data']}");

    if (decodedJson['code'] == 200) {
      log("enter into code 200");
      
      return GlobalPrayerTimeResponseModel.fromJson(decodedJson);
    } else {
      throw ServerException(
        message: decodedJson['message'],
        statusCode: decodedJson['code'],
      );
    }
  }
}
