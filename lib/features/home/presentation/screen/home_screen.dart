import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamat_app/core/exceptions/exceptions.dart';
import 'package:jamat_app/features/common/presentation/widget/custome_dropdown_widget.dart';
import 'package:jamat_app/features/home/data/model/response_model/mosque_model.dart';
import 'package:jamat_app/features/home/presentation/cubit/mosque_dropdown_cubit.dart';
import 'package:jamat_app/features/home/presentation/cubit/validation_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MosqueDropdownCubit mosqueDropdownCubit;
  callingApi() async {
    await mosqueDropdownCubit.requestMosqueDropdown();
  }

  @override
  void initState() {
    mosqueDropdownCubit = context.read<MosqueDropdownCubit>();
    callingApi();
    super.initState();
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
                  SimpleDropdown(
                    items: state.data == null
                        ? []
                        : state.data!.map((mosque) => mosque.name).toList(),
                    onChange: (value) {
                      context.read<HomeCubit>().changeEmail(value);
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                    onChanged: (value) {
                      context.read<HomeCubit>().changeEmail(value);
                    },
                  ),
                  Text(state.email ?? ''),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
