import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:news_app_clean_architecture/core/shared/button_component.dart';
import 'package:news_app_clean_architecture/core/shared/color_constant.dart';
import 'package:news_app_clean_architecture/core/shared/enums/gender_type.dart';
import 'package:news_app_clean_architecture/core/shared/font_constant.dart';
import 'package:news_app_clean_architecture/core/shared/input_component.dart';
import 'package:news_app_clean_architecture/core/shared/validation.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/home_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  // GlobalObjectKey<FormState> globalKey = GlobalObjectKey<FormState>(Random.secure().nextInt(1000));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status.isInProgress) {
            return Container(
              color: background,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state.status.isFailure) {
            return Container(
              color: background,
              child: Center(
                child: Text(
                  state.status.name,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                decoration: const BoxDecoration(color: background),
                child: ListView(
                  children: [
                    TextFormFieldBase(
                      title: 'نام',
                      hintText: 'نام خود را وارد کنید',
                      submitted: false,
                      textAlign: TextAlign.right,
                      validator: CheckIsEmptyValidator(),
                      txtChange: (txt) {
                        context.read<HomeBloc>().add(LoginNameChanged(txt));
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormFieldBase(
                      title: 'نام خانوادگی',
                      hintText: 'نام  خانوادگی خود را وارد کنید',
                      submitted: false,
                      textAlign: TextAlign.right,
                      validator: CheckIsEmptyValidator(),
                      txtChange: (txt) {
                        context.read<HomeBloc>().add(LoginFamilyChanged(txt));
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    PhoneNumberTextField(
                      title: 'شماره موبایل',
                      hintText: 'شماره موبایل خود را وارد کنید',
                      submitted: false,
                      validator: CheckIsEmptyValidator(),
                      txtChange: (txt) {
                        context.read<HomeBloc>().add(LoginMobileChanged(txt));
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SelectGender(
                      title: 'جنسیت',
                      hintTextOne: 'مرد',
                      hintTextTwo: 'زن',
                      type: GenderType.MAN,
                      onClick: (GenderType type) => {},
                    ),
                    const SizedBox(
                      height: 44.0,
                    ),
                    ElevatedButtonBase(
                        title: 'ذخیره',
                        onPressed: () {
                          context.read<HomeBloc>().add(BtnSubmitted());
                        },
                        style: md16(color: white))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
