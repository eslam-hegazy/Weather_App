import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterclean1/core/app_color.dart';
import 'package:flutterclean1/core/constants.dart';
import 'package:flutterclean1/core/image_manager.dart';
import 'package:flutterclean1/core/request_state.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_cubit.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_state.dart';
import 'package:flutterclean1/presentation/widgets/item.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/Weather.dart';

class MyHome extends StatelessWidget {
  PageController pageController = PageController(
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        List<Weather?> data = [
          cubit.cairoWeather,
          cubit.alexWeather,
          cubit.portSaidWeather,
          cubit.suezWeather,
          cubit.luxorWeather,
          cubit.tantaWeather,
          cubit.asyutWeather,
        ];
        switch (state.requestState) {
          case RequestState.isLoading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.isLoaded:
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: false,
                title: Text("appTitle".tr()),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    onPressed: () {
                      translator.setNewLanguage(
                        context,
                        newLanguage:
                            translator.currentLanguage == 'ar' ? 'en' : 'ar',
                        remember: true,
                        restart: true,
                      );
                    },
                    icon: const Icon(Icons.language),
                  ),
                  IconButton(
                      onPressed: () {
                        AdaptiveTheme.of(context).toggleThemeMode();
                      },
                      icon: const Icon(Icons.brightness_4_outlined)),
                ],
              ),
              body: PageView.builder(
                controller: pageController,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.asset(
                        getImage[index],
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            SmoothPageIndicator(
                              controller: pageController,
                              count: data.length,
                              effect: const ScrollingDotsEffect(
                                spacing: 5,
                                dotHeight: 5,
                                dotWidth: 8,
                                dotColor: AppColor.kWhite,
                                activeDotColor: Colors.red,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              data[index]!.cityName,
                              style: GoogleFonts.acme(
                                fontSize: 30.sp,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              getDateTime(),
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data[index]!.description,
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${(data[index]!.temp - 273.15).round().toString()}\u2103",
                              style: GoogleFonts.acme(fontSize: 50.sp),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  getIconWeather(),
                                  height: 4.h,
                                  color: AppColor.kGrey,
                                ),
                                SizedBox(width: 2.w),
                                Text(
                                  getDateOfDay().tr(),
                                  style: GoogleFonts.cairo(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Item(
                                  title: "Speed",
                                  num: "${(data[index]!.speed).toString()} ",
                                  tem: "m/s",
                                ),
                                Item(
                                  title: "Min",
                                  num:
                                      "${(data[index]!.temp_min - 273.15).round().toString()} ",
                                  tem: "\u2103",
                                ),
                                Item(
                                  title: "Max",
                                  num:
                                      "${(data[index]!.temp_max - 273.15).round().toString()} ",
                                  tem: "\u2103",
                                ),
                                Item(
                                  title: "Pressure",
                                  num:
                                      "${(data[index]!.temp_max - 273.15).round().toString()} ",
                                  tem: "ρh",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          case RequestState.error:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
