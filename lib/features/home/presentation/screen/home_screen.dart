import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/common/presentation/widget/custome_dropdown_widget.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';
import 'package:jamat_app/features/home/presentation/cubit/location_api_cubit/location_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_api_cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MosqueDropdownCubit mosqueDropdownCubit;
  late LocationDropdownCubit locationDropdownCubit;
  callingApi() async {
    locationDropdownCubit.requestLocationDropdown(LocationDropdownRequestModel());
  }
  // callingApi(int? oid) async {
  //   if(oid != null){
  //     mosqueDropdownCubit.requestMosqueDropdown(oid);
  //   }else{
  //     mosqueDropdownCubit.requestMosqueDropdown(oid);
  //   }
  // }

  @override
  void initState() {
    mosqueDropdownCubit = context.read<MosqueDropdownCubit>();
    locationDropdownCubit = context.read<LocationDropdownCubit>();
    callingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Datum> mosqueList = [];
    List<Datum> locationList = [];
    return MultiBlocListener(
      listeners: [
        BlocListener<LocationDropdownCubit, LocationDropdownState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                locationList = success.data ?? [];
                context.read<HomeCubit>().changeLocationDropdownList(locationList);
                // log("the mosque list is $mosqueList");
              },
              failed: (failedType, failTrace) {
                if (failedType is ServerException) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Server Error'),
                          content: Text(failedType.message),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      });
                } else if (failedType is NoInternetException) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('No Internet'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      });
                }
              },
              orElse: () => null,
            );
          },
        ),
        BlocListener<MosqueDropdownCubit, MosqueDropdownState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                mosqueList = success.data ?? [];
                context.read<HomeCubit>().changeMosqueDropdownList(mosqueList);
                // log("the mosque list is $mosqueList");
              },
              failed: (failedType, failTrace) {
                if (failedType is ServerException) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Server Error'),
                          content: Text(failedType.message),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      });
                } else if (failedType is NoInternetException) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('No Internet'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      });
                }
              },
              orElse: () => null,
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: SimpleDropdown(
                            hintText: "Select Location",
                            items: state.locationData == null ? [] :
                            state.locationData!.map((value) => value.location).toList(),
                            onChange: (value) {
                              context.read<HomeCubit>().changeLocation(value);
                              final int index1 = state.locationData!
                                  .indexWhere(((e) => (e.location) == value));
                              mosqueDropdownCubit.requestMosqueDropdown(int.parse(state.locationData![index1].oid.toString()));
                              // context.read<HomeCubit>().changeMosque(
                              //     state.data![index1].oid.toString());
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: SimpleDropdown(
                            items: state.mosqueData == null
                                ? []
                                :
                                state.mosqueData!
                                    .map((mosque) => mosque.name)
                                    .toList(),
                            onChange: (value) {
                              context.read<HomeCubit>().changeMosque(value);
                              // final int index1 = state.data!
                              //     .indexWhere(((e) => (e.name) == value));
                              // context.read<HomeCubit>().changeLocation(
                              //     state.data![index1].location.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(state.mosque ?? ''),
                  Text(state.location ?? ''),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
