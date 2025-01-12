import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/domain/usecase/mosque_dropdown_usecase.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_api_cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';
import 'dependency.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await sl.init();

final providerList = <BlocProvider>[
  BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(),
  ),
  BlocProvider(
    create: (context) =>
        MosqueDropdownCubit(usecase: sl<MosqueDropdownUsecase>()),
  ),
];
