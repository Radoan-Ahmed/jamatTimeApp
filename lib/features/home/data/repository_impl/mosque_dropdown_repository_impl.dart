import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/datasource/mosque_dropdown_remote_source.dart';
import 'package:jamat_app/features/home/data/model/request_model/mosque_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_dropdown_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/mosque_dropdown_repository.dart';

import '../../../../core/exceptions/internet_exception_thrower.dart';

@Injectable(as: MosqueDropdownRepository)
class MosqueDropdownRepositoryImpl extends MosqueDropdownRepository {
  final MosqueDropdownRemote remote;
  final InternetExceptionThrower networkExceptionThrower;

  MosqueDropdownRepositoryImpl({
    required this.remote,
    required this.networkExceptionThrower,
  });

  @override
  Future<MosqueDropdownResponseModel> mosqueDropdown(MosqueDropdownRequestModel model) async {
    await networkExceptionThrower.throwInternetException();

    final response = await remote.mosqueDropdown(model);

    return response;
  }
}
