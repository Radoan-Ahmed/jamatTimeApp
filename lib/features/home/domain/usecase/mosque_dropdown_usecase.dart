import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/model/request_model/mosque_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/mosque_dropdown_repository.dart';


@Injectable()
class MosqueDropdownUsecase {
  final MosqueDropdownRepository repository;

  MosqueDropdownUsecase({required this.repository});

  Future<MosqueDropdownResponseModel> call(MosqueDropdownRequestModel requestModel) async =>
      await repository.mosqueDropdown(requestModel);
}
