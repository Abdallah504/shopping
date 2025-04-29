import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import '../../view-model/core/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appCubit(context).dark==true
                  ? [Colors.black, Colors.grey.shade900]
                  : [Colors.orange.shade100, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),

                // Profile Avatar
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: appCubit(context).dark==true
                          ? [Colors.white24, Colors.black]
                          : [Colors.orange.shade100, Colors.white],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: appCubit(context).dark==true ? Colors.orangeAccent.withOpacity(0.3) : Colors.black12,
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4.r),
                  child: CircleAvatar(
                    radius: 45.r,
                    backgroundImage: AssetImage('assets/user.jpg'), // Add your asset
                  ),
                ),
                SizedBox(height: 20.h),

                // Profile Settings Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: appCubit(context).dark==true ? Colors.black54 : Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: appCubit(context).dark==true ? Colors.white12 : Colors.black12,
                        blurRadius: 15,
                        offset: Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: AppColors().orange,
                      width: 1.2.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Language Switch
                      Row(
                        children: [
                          Icon(Icons.language, color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                          SizedBox(width: 8.w),
                          Text(
                            'language'.tr(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: appCubit(context).dark==true ? AppColors().white : AppColors().black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Row(
                            children: [
                              Text(
                                'english'.tr(),
                                style: TextStyle(
                                    color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                              ),
                              Switch(
                                value: appCubit(context).lang,
                                activeColor: AppColors().orange,
                                inactiveThumbColor: Colors.black,
                                onChanged: (v) {
                                  if (appCubit(context).lang) {
                                    context.setLocale(const Locale('en'));
                                    appCubit(context)
                                        .ChnageLang(v, context.locale.languageCode);
                                  } else {
                                    context.setLocale(const Locale('ar'));
                                    appCubit(context)
                                        .ChnageLang(v, context.locale.languageCode);
                                  }
                                },
                              ),
                              Text(
                                'arabic'.tr(),
                                style: TextStyle(
                                    color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Divider(thickness: 1.h, color: AppColors().orange.withOpacity(0.3)),
                      SizedBox(height: 10.h),

                      // Theme Switch
                      Row(
                        children: [
                          Icon(appCubit(context).dark==true ? Icons.dark_mode : Icons.light_mode,
                              color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                          SizedBox(width: 8.w),
                          Text(
                            'theme'.tr(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: appCubit(context).dark==true ? AppColors().white : AppColors().black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'lightmode'.tr(),
                                style: TextStyle(
                                    color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                              ),
                              Switch(
                                value: appCubit(context).dark,
                                activeColor: Colors.white,
                                inactiveThumbColor: Colors.black,
                                activeTrackColor: Colors.black,
                                inactiveTrackColor: Colors.white,
                                onChanged: (v) {
                                  appCubit(context).ChnageTheme(v);
                                },
                              ),
                              Text(
                                'darkMode'.tr(),
                                style: TextStyle(
                                    color: appCubit(context).dark==true ? AppColors().white : AppColors().black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
