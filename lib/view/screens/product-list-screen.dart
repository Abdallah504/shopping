import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import 'package:shopping/view-model/logic/product-cubit/product_cubit.dart';
import 'package:shopping/view/screens/main-screen.dart';
import 'package:shopping/view/screens/product-detail-screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          return BlocConsumer<ProductCubit,ProductState>(
              builder: (context,state){
                return Scaffold(
                  backgroundColor: appCubit(context).dark==true?AppColors().black:AppColors().white,
                  appBar: AppBar(
                    backgroundColor: appCubit(context).dark==true?AppColors().black:AppColors().white ,
                    leading: IconButton(
                    icon: Icon(
                    Icons.arrow_back,
                    color:appCubit(context).dark==true
                        ? AppColors().white
                        : AppColors().black,
                ),
                onPressed: () {

                Navigator.pop(context);
                },
                    ),

                    elevation: 1,
                    title: Text(
                      "allProducts".tr(),
                      style: TextStyle(
                        color: appCubit(context).dark==true
                            ? AppColors().white
                            : AppColors().black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    centerTitle: true,
                  ),
                  body:state is ProductData || prodCubit(context).productListModel !=null? Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: GridView.builder(
                      itemCount: prodCubit(context).productListModel!.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300.h,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: appCubit(context).dark==false
                                ? AppColors().white
                                : AppColors().black,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color: appCubit(context).dark==false?AppColors().black:AppColors().white
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: appCubit(context).dark==true
                                    ? AppColors().white
                                    : Colors.grey,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
                                child: Image.network(
                                  prodCubit(context).productListModel!.products![index].images![0].toString(),
                                  height: 140.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/logo.jpg',
                                      height: 140.h,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      prodCubit(context).productListModel!.products![index].title.toString(),
                                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600,
                                          color:appCubit(context).dark==true
                                              ? AppColors().white
                                              : AppColors().black
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "\$${prodCubit(context).productListModel!.products![index].price}",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors().orange,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    ElevatedButton(
                                      onPressed: () {
                                        prodCubit(context).getProdDetail(id:prodCubit(context).productListModel!.products![index].id! );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>  ProductDetailScreen(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors().orange,
                                        minimumSize: Size(double.infinity, 36.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                      ),
                                      child: Text(
                                        "moreDetails".tr(),
                                        style: TextStyle(fontSize: 14.sp,
                                            color: appCubit(context).dark==true
                                                ? AppColors().white
                                                : AppColors().black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ): Center(
                    child: CircularProgressIndicator(
                      color: AppColors().orange,
                    ),
                  ),
                );
              }, listener: (context,state){

          });
        }, listener: (context,state){});
  }
}
