import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/datasource/location_dropdown_remote_source.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/location_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/location_dropdown_repository.dart';

import '../../../../core/exceptions/internet_exception_thrower.dart';

@Injectable(as: LocationDropdownRepository)
class LocationDropdownRepositoryImpl extends LocationDropdownRepository {
  final LocationDropdownRemote remote;
  final InternetExceptionThrower networkExceptionThrower;

  LocationDropdownRepositoryImpl({
    required this.remote,
    required this.networkExceptionThrower,
  });

  @override
  Future<LocationDropdownResponseModel> locationDropdown(LocationDropdownRequestModel model) async {
    await networkExceptionThrower.throwInternetException();

    final response = await remote.locationDropdown(model);

    return response;
  }
}
