import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/di.dart';
import 'package:shopping/view/screens/splash-screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Path to translation files
      fallbackLocale:  Locale('en'), // Default locale
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,_){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: context.locale, // Locale from EasyLocalization
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: SplashScreen(),
        );
      },
    );
  }
}

