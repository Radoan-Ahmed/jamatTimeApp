import 'package:jamat_app/features/home/data/model/request_model/mosque_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_dropdown_response_model.dart';

abstract class MosqueDropdownRepository {
  Future<MosqueDropdownResponseModel> mosqueDropdown(MosqueDropdownRequestModel model);
}