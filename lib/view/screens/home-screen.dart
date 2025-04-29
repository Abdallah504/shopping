import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import 'package:shopping/view/widgets/banner-widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'PEMvVkFrGQs', // Replace with your video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: YoutubePlayer(
                  controller: _youtubeController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appCubit(context).dark==true
                        ? AppColors().white
                        : AppColors().black,
                    borderRadius: BorderRadius.circular(10).r
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(8.0).r,
                        child: Text('want'.tr(),style: TextStyle(color: appCubit(context).dark==false
                            ? AppColors().white
                            : AppColors().black,
                            fontSize: 20.sp
                        ),),
                      ),

                      SizedBox(height: 10.h,),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:  EdgeInsets.all(8.0).r,
                          child: Text('',style: TextStyle(color: appCubit(context).dark==false
                              ? AppColors().orange
                              : AppColors().black,
                          fontSize: 12.sp
                          ),),
                        ),
                      ),
                    ],
                  ),
                )
              ),

            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
