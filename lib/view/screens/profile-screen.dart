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
    return BlocConsumer<AppCubit,AppState>(builder: (context,state){
      return Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h,),

              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 110.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    border: Border.all(color:appCubit(context).dark==false? AppColors().black:AppColors().orange,width: 1.5.w )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'english'.tr(),
                            style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                          ),
                          Switch(value: appCubit(context).lang,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.white,
                              inactiveThumbColor: Colors.black,
                              trackOutlineColor:MaterialStatePropertyAll(AppColors().orange) ,
                              onChanged: (v){
                                if(appCubit(context).lang==true){
                                  context.setLocale(const Locale('en'));
                                  appCubit(context).ChnageLang(v, context.locale.languageCode);
                                }else{
                                  context.setLocale(const Locale('ar'));
                                  appCubit(context).ChnageLang(v, context.locale.languageCode);
                                }
                              }),
                          Text(
                            'arabic'.tr(),
                            style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'lightmode'.tr(),
                            style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                          ),
                          Switch(value: appCubit(context).dark,
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.white,
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.black,
                              trackOutlineColor:MaterialStatePropertyAll(AppColors().orange) ,
                              onChanged: (v){

                                appCubit(context).ChnageTheme(v);
                              }),
                          Text(
                            'darkMode'.tr(),
                            style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
        listener: (context,state){});
  }
}
