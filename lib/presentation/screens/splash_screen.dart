import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_cubit.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_state.dart';
import 'package:flutterclean1/presentation/screens/myhome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
      GlobalCubit.get(context).navigate(
          afterSuccess: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) {
                return MyHome();
              })));

      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/images/weather_light.json", height: 50.h),
              Text(
                'appTitle'.tr(),
                style: GoogleFonts.akronim(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    });
  }
}
