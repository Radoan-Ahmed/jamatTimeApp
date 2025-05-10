import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';
import 'package:jamat_app/features/home/presentation/cubit/global_prayer_time_api_cubit/global_prayer_time_api_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MosqueDropdownCubit mosqueDropdownCubit;
  late HomeCubit homeCubit;
  late Timer timer;
  callingApi() async {
    // await mosqueDropdownCubit.requestMosqueDropdown();
    await context
        .read<GlobalPrayerTimeApiCubit>()
        .requestGlobalPrayerTimeApi("college gate, dhaka");
  }

  @override
  void initState() {
    mosqueDropdownCubit = context.read<MosqueDropdownCubit>();
    homeCubit = context.read<HomeCubit>();
    callingApi();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    List<Datum> mosqueList = [];
    return MultiBlocListener(
      listeners: [
        BlocListener<MosqueDropdownCubit, MosqueDropdownState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                log("enter into success block ${json.encode(success.data)}");
                mosqueList = success.data ?? [];
                homeCubit.changeMosqueDropdownList(mosqueList);
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
        BlocListener<GlobalPrayerTimeApiCubit, GlobalPrayerTimeApiState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (success) {
                log("enter into success block ${json.encode(success.data)}");
                log("the time is : ${json.encode(success.data?.times)}");
                Map<String, dynamic> map =
                    json.decode(json.encode(success.data?.times));
                log("the map of time is: ${map}");
                homeCubit.updatedPrayerState(map);
                timer = Timer.periodic(const Duration(seconds: 1),
                    (_) => homeCubit.updatedPrayerState(map));
                // map.forEach((key, value){
                //   final parts = value.split(" ");
                //   final timeParts = parts[0].split(":");
                //   log("the parts are: $parts");
                //   log("the time parts are: $timeParts");
                // });
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
            return Center(
              child: Container(
                height: 200,
                width: 200,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Text("Next Prayer",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(state.nextPrayer??"", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 6),
                      Text("Time: ${state.nextTime}", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 12),
                      Text("Starts in: ${_formatDuration(state.timeRemaining ?? Duration.zero)}",
                          style: TextStyle(fontSize: 16, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            );
            // return SingleChildScrollView(
            //   child: Center(
            //       child: Column(
            //     children: [
            //       SimpleDropdown(
            //         items: state.data == null
            //             ? []
            //             : state.data!.map((mosque) => mosque.name).toList(),
            //         onChange: (value) {
            //           homeCubit.changeEmail(value);
            //         },
            //       ),
            //       TextField(
            //         decoration: const InputDecoration(
            //           hintText: 'Enter your name',
            //         ),
            //         onChanged: (value) {
            //           homeCubit.changeEmail(value);
            //         },
            //       ),
            //       Text(state.email ?? ''),
            //     ],
            //   )),
            // );
          },
        ),
      ),
    );
  }
}
