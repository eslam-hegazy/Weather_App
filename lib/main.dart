import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterclean1/core/theme_app.dart';
import 'package:flutterclean1/data/local_data/cache_helper.dart';
import 'package:flutterclean1/presentation/controller/MyBlocObserver.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_cubit.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_event.dart';
import 'package:flutterclean1/presentation/controller/cubit/global_state.dart';
import 'package:flutterclean1/presentation/screens/myhome.dart';
import 'package:flutterclean1/presentation/screens/splash_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );
  runApp(LocalizedApp(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit()
        ..add(GetWeatherCairoEvent())
        ..add(GetWeatherAlexandriaEvent())
        ..add(GetWeatherPortSaidEvent())
        ..add(GetWeatherSuezEvent())
        ..add(GetWeatherAsyutEvent())
        ..add(GetWeatherTantaEvent())
        ..add(GetWeatherLuxorEvent()),
      lazy: false,
      child: AdaptiveTheme(
        light: lightTheme(),
        dark: darkTheme(),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              localizationsDelegates:
                  translator.delegates, // Android + iOS Delegates
              locale: translator.locale, // Active locale
              supportedLocales: translator.locals(),
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: Directionality(
                textDirection: translator.currentLanguage == 'en'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: SplashScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
