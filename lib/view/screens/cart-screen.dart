import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appCubit(context).dark ==false
                  ? AppColors().white
                  : AppColors().black,
              elevation: 1,
              title: Text(
                "yourCart".tr(),
                style: TextStyle(
                  color: appCubit(context).dark
                      ? AppColors().white
                      : AppColors().black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: Icon(Icons.shopping_cart, color: Colors.orange),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/empty.json', // Include your lottie file
                          height: 200.h,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "yourCartIsEmpty".tr(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color:appCubit(context).dark
                                ? AppColors().white
                                : AppColors().black ,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "nothing".tr(),
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Navigate to product screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          icon: Icon(Icons.explore,color: appCubit(context).dark ==false
                              ? AppColors().white
                              : AppColors().black),
                          label: Text(
                            "exploreProducts".tr(),
                            style: TextStyle(fontSize: 16.sp,
                                color: appCubit(context).dark ==false
                                ? AppColors().white
                                : AppColors().black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // Bottom bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: appCubit(context).dark ==false
                        ? AppColors().white
                        : AppColors().black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "total".tr(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: appCubit(context).dark
                                  ? AppColors().white
                                  : AppColors().black
                            ),
                          ),
                          Text(
                            ": \$0.00",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: appCubit(context).dark
                                  ? AppColors().white
                                  : AppColors().black
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle checkout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                        ),
                        child: Text(
                          "checkout".tr(),
                          style: TextStyle(fontSize: 16.sp,color: AppColors().white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        listener: (context,state){});
  }
}
