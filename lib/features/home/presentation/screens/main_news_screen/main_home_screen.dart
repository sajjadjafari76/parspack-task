import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/shared/button_component.dart';
import 'package:news_app_clean_architecture/core/shared/color_constant.dart';
import 'package:news_app_clean_architecture/core/shared/enums/gender_type.dart';
import 'package:news_app_clean_architecture/core/shared/font_constant.dart';
import 'package:news_app_clean_architecture/core/shared/input_component.dart';
import 'package:news_app_clean_architecture/core/shared/validation.dart';
import 'package:news_app_clean_architecture/features/home/domain/entity/home_entity.dart';
import 'package:news_app_clean_architecture/features/home/presentation/screens/bloc/main_home_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainHomeBloc, MainHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MainNewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MainNewsErrorState) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state is MainNewsGetRecentNewsSuccessState) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 24.0
                ),
                decoration: const BoxDecoration(
                  color: background
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextFormFieldBase(
                      title: 'نام',
                      hintText: 'نام خود را وارد کنید',
                      submitted: false,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 24.0,),
                    const TextFormFieldBase(
                      title: 'نام خانوادگی',
                      hintText: 'نام  خانوادگی خود را وارد کنید',
                      submitted: false,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 24.0,),
                    const PhoneNumberTextField(
                      title: 'شماره موبایل',
                      hintText: 'شماره موبایل خود را وارد کنید',
                      submitted: false,
                    ),
                    const SizedBox(height: 24.0,),
                    SelectGender(
                      title: 'جنسیت',
                      hintTextOne: 'مرد',
                      hintTextTwo: 'زن',
                      type: GenderType.MAN,
                      onClick: (GenderType type) => {},
                    ),
                    const SizedBox(height: 44.0,),
                    ElevatedButtonBase(title: 'ذخیره', onPressed: (){}, style: md16(color: white ))
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _newsItem(HomeEntity news) {
    final borderRadius = BorderRadius.circular(10);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          if (news.imageUrl == null)
            const Center(
              child: Text(
                "No Image",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (news.imageUrl != null)
            CachedNetworkImage(
              imageUrl: news.imageUrl!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Text(
                  "No Image",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              stops: const [0, 0.4, 0.6, 1],
              colors: [Colors.transparent, Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    if (news.publishedAt != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(999)),
                            child: Text(news.publishedAt!.split("T")[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        ],
                      )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(news.title?.trim() ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        )),
                    if (news.description != null)
                      Text(
                        news.description!.trim(),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[400],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
