import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/common/presentation/widget/custome_dropdown_widget.dart';
import 'package:jamat_app/features/home/data/model/request_model/jamat_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/request_model/location_dropdown_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/jamat_time_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';
import 'package:jamat_app/features/home/presentation/cubit/jamat_time_api_cubit/jamat_time_cubit.dart';
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
  late JamatTimeCubit jamatTimeCubit;
  callingApi() async {
    locationDropdownCubit
        .requestLocationDropdown(LocationDropdownRequestModel());
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
    jamatTimeCubit = context.read<JamatTimeCubit>();
    callingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Datum> mosqueList = [];
    List<Datum> locationList = [];
    List<Rows>? jamatTimeList = [];
    JamatTimeRequestModel jamatTimeRequestModel = JamatTimeRequestModel();
    return MultiBlocListener(
      listeners: [
        BlocListener<JamatTimeCubit, JamatTimeState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                jamatTimeList = success.data?.rows ?? [];
                context.read<HomeCubit>().changeJamatTimeList(jamatTimeList!);
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
        BlocListener<LocationDropdownCubit, LocationDropdownState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                locationList = success.data ?? [];
                context
                    .read<HomeCubit>()
                    .changeLocationDropdownList(locationList);
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
          },
          child: const Icon(Icons.add),
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
                            items: state.locationData == null
                                ? []
                                : state.locationData!
                                    .map((value) => value.location)
                                    .toList(),
                            onChange: (value) {
                              context.read<HomeCubit>().changeLocation(value);
                              final int index1 = state.locationData!
                                  .indexWhere(((e) => (e.location) == value));
                              mosqueDropdownCubit.requestMosqueDropdown(
                                  int.parse(state.locationData![index1].oid
                                      .toString()));
                              // context.read<HomeCubit>().changeMosque(
                              //     state.data![index1].oid.toString());
                              jamatTimeRequestModel.location = value;
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
                                : state.mosqueData!
                                    .map((mosque) => mosque.name)
                                    .toList(),
                            onChange: (value) {
                              context.read<HomeCubit>().changeMosque(value);
                              // final int index1 = state.mosqueData!
                              //     .indexWhere(((e) => (e.name) == value));
                              jamatTimeRequestModel.mosqueName = value;
                              jamatTimeCubit
                                  .requestJamatTime(jamatTimeRequestModel);
                              // context.read<HomeCubit>().changeLocation(
                              //     state.data![index1].location.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state.jamatTimeData == null
                      ? SizedBox()
                      : createTableWidget(state.jamatTimeData ?? []),
                ],
              )),
            );
          },
        ),
      ),
    );
  }

  Widget createTableWidget(List<Rows> jamatTimeData) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Table(
        border: TableBorder.all(color: Colors.grey, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
        },
        children: [
          const TableRow(
            decoration: BoxDecoration(color: Colors.blue),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Prayer Name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Jamaat Time',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Table Data Rows
          ...jamatTimeData.map(
            (prayer) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(prayer.prayerName ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(prayer.jamatTime ?? ""),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
