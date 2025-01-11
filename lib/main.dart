import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jamat_app/app.dart';
import 'package:jamat_app/core/dependency/dependency.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await configureDependencies();

  runApp(App());
}
