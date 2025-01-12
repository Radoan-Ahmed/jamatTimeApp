import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/location_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/location_dropdown_repository.dart';


@Injectable()
class LocationDropdownUsecase {
  final LocationDropdownRepository repository;

  LocationDropdownUsecase({required this.repository});

  Future<LocationDropdownResponseModel> call(LocationDropdownRequestModel requestModel) async =>
      await repository.locationDropdown(requestModel);
}
