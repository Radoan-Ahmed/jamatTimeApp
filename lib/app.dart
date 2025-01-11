import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/dependency/dependency.dart';
import 'package:jamat_app/core/navigation/route_config.dart';

class App extends StatelessWidget {
  App({super.key});

  final routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providerList,
      child: MaterialApp(
        title: 'Jamat App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routeConfig.routes,
      ),
    );
  }
}
