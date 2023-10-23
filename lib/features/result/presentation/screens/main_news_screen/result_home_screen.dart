import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/shared/color_constant.dart';
import 'package:news_app_clean_architecture/core/shared/font_constant.dart';
import 'package:news_app_clean_architecture/core/shared/shadow_constant.dart';
import 'package:news_app_clean_architecture/features/result/presentation/screens/bloc/result_bloc.dart';

class ResultHomeScreen extends StatelessWidget {
  const ResultHomeScreen({super.key});

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
          if (state.person.isEmpty) {
            return Container(
              color: white,
              child: Center(
                child: Text('رکوردی یافت نشد', style: md16(),),
              ),
            );
          }

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
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: white
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text('نام  : ${state.person[item].name}', style: md12(),),
                            Text('فامیلی  : ${state.person[item].family}', style: md12(),),
                            Text('شماره موبایل : ${state.person[item].phone}', style: md12(),),
                            Text('جنسیت  : ${state.person[item].gender}', style: md12(),),

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
