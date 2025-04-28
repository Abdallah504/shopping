import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/core/di.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import 'package:shopping/view/screens/splash-screen.dart';
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Path to translation files
      fallbackLocale: Locale('en'), // Default locale
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<AppCubit>()..ReadLang()..ReadTheme())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                scaffoldMessengerKey: scaffoldMessengerKey,
                debugShowCheckedModeBanner: false,
                title: 'Shopping',
                theme: ThemeData(
                  brightness: appCubit(context).dark
                      ? Brightness.dark
                      : Brightness.light,
                  useMaterial3: true,
                ),
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

