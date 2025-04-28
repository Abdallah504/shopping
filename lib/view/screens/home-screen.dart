import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import 'package:shopping/view/widgets/banner-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              BannerWidget(),
              SizedBox(height: 20.h,),
              Align(
                  alignment:appCubit(context).lang==false? Alignment.topLeft:Alignment.topRight,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0).r,
                    child: Text('trendingProducts'.tr(),
                      style: TextStyle(fontSize: 25.sp,color:appCubit(context).dark==false? AppColors().black:AppColors().white,
                          fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                  )
              ),


            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
