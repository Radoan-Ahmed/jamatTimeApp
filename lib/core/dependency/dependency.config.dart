// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasource/jamat_time_remote_source.dart'
    as _i452;
import '../../features/home/data/datasource/location_dropdown_remote_source.dart'
    as _i112;
import '../../features/home/data/datasource/mosque_dropdown_remote_source.dart'
    as _i29;
import '../../features/home/data/repository_impl/jamat_time_repository_impl.dart'
    as _i927;
import '../../features/home/data/repository_impl/location_dropdown_repository_impl.dart'
    as _i86;
import '../../features/home/data/repository_impl/mosque_dropdown_repository_impl.dart'
    as _i862;
import '../../features/home/domain/repository/jamat_time_repository.dart'
    as _i315;
import '../../features/home/domain/repository/location_dropdown_repository.dart'
    as _i536;
import '../../features/home/domain/repository/mosque_dropdown_repository.dart'
    as _i502;
import '../../features/home/domain/usecase/jamat_time_usecase.dart' as _i38;
import '../../features/home/domain/usecase/location_dropdown_usecase.dart'
    as _i216;
import '../../features/home/domain/usecase/mosque_dropdown_usecase.dart'
    as _i117;
import '../exceptions/internet_exception_thrower.dart' as _i228;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i29.MosqueDropdownRemote>(
        () => _i29.MosqueDropdownRemoteImpl());
    gh.factory<_i112.LocationDropdownRemote>(
        () => _i112.LocationDropdownRemoteImpl());
    gh.factory<_i228.InternetExceptionThrower>(
        () => _i228.InternetExceptionThrowerImpl());
    gh.factory<_i502.MosqueDropdownRepository>(
        () => _i862.MosqueDropdownRepositoryImpl(
              remote: gh<_i29.MosqueDropdownRemote>(),
              networkExceptionThrower: gh<_i228.InternetExceptionThrower>(),
            ));
    gh.factory<_i452.JamatTimeRemote>(() => _i452.JamatTimeRemoteImpl());
    gh.factory<_i117.MosqueDropdownUsecase>(() => _i117.MosqueDropdownUsecase(
        repository: gh<_i502.MosqueDropdownRepository>()));
    gh.factory<_i536.LocationDropdownRepository>(
        () => _i86.LocationDropdownRepositoryImpl(
              remote: gh<_i112.LocationDropdownRemote>(),
              networkExceptionThrower: gh<_i228.InternetExceptionThrower>(),
            ));
    gh.factory<_i315.JamatTimeRepository>(() => _i927.JamatTimeRepositoryImpl(
          remote: gh<_i452.JamatTimeRemote>(),
          networkExceptionThrower: gh<_i228.InternetExceptionThrower>(),
        ));
    gh.factory<_i216.LocationDropdownUsecase>(() =>
        _i216.LocationDropdownUsecase(
            repository: gh<_i536.LocationDropdownRepository>()));
    gh.factory<_i38.JamatTimeUsecase>(() =>
        _i38.JamatTimeUsecase(repository: gh<_i315.JamatTimeRepository>()));
    return this;
  }
}
