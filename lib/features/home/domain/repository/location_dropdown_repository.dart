import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/location_dropdown_response_model.dart';

abstract class LocationDropdownRepository {
  Future<LocationDropdownResponseModel> locationDropdown(LocationDropdownRequestModel model);
}