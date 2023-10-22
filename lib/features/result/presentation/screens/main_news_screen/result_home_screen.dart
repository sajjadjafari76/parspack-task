import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/shared/color_constant.dart';
import 'package:news_app_clean_architecture/core/shared/shadow_constant.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';

class ResultHomeScreen extends StatelessWidget {
  const ResultHomeScreen({super.key});

  // GlobalObjectKey<FormState> globalKey = GlobalObjectKey<FormState>(Random.secure().nextInt(1000));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResultBloc, ResultState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ResultLoadingState) {
          return Container(
            color: background,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is ResultErrorState) {
          return Container(
            color: background,
            child: Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        if (state is ResultSuccessState) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                  decoration: const BoxDecoration(color: background),
                  child: ListView.builder(
                    itemCount: state.person.length,
                    itemBuilder: (context, item) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            shadowXS
                          ]
                        ),
                        child: Column(
                          children: [

                            Text('name is : ${state.person[item].name}'),
                            Text('family is : ${state.person[item].family}'),
                            Text('mobile is : ${state.person[item].phone}'),
                            Text('age is : ${state.person[item].age}'),

                          ],
                        ),
                      );
                    },
                  )),
            ),
          );
        }
        return Container(
          color: background,
        );
      },
    );
  }
}
