// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasource/global_prayer_time_remote_source.dart'
    as _i326;
import '../../features/home/data/datasource/mosque_dropdown_remote_source.dart'
    as _i29;
import '../../features/home/data/repository_impl/global_prayer_time_repository_impl.dart'
    as _i970;
import '../../features/home/data/repository_impl/mosque_dropdown_repository_impl.dart'
    as _i862;
import '../../features/home/domain/repository/global_prayer_time_repository.dart'
    as _i775;
import '../../features/home/domain/repository/mosque_dropdown_repository.dart'
    as _i502;
import '../../features/home/domain/usecase/global_prayer_time_usecase.dart'
    as _i125;
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
    gh.factory<_i228.InternetExceptionThrower>(
        () => _i228.InternetExceptionThrowerImpl());
    gh.factory<_i502.MosqueDropdownRepository>(
        () => _i862.MosqueDropdownRepositoryImpl(
              remote: gh<_i29.MosqueDropdownRemote>(),
              networkExceptionThrower: gh<_i228.InternetExceptionThrower>(),
            ));
    gh.factory<_i326.GlobalPrayerTimeRemote>(
        () => _i326.GlobalPrayerTimeRemoteImpl());
    gh.factory<_i117.MosqueDropdownUsecase>(() => _i117.MosqueDropdownUsecase(
        repository: gh<_i502.MosqueDropdownRepository>()));
    gh.factory<_i775.GlobalPrayerTimeRepository>(
        () => _i970.GlobalPrayerTimeRepositoryImpl(
              remote: gh<_i326.GlobalPrayerTimeRemote>(),
              networkExceptionThrower: gh<_i228.InternetExceptionThrower>(),
            ));
    gh.factory<_i125.GlobalPrayerTimeUsecase>(() =>
        _i125.GlobalPrayerTimeUsecase(
            repository: gh<_i775.GlobalPrayerTimeRepository>()));
    return this;
  }
}
