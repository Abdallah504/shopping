import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view/screens/product-list-screen.dart';

import '../../view-model/core/constant.dart';
import '../../view-model/logic/app-cubit/app_cubit.dart';
import '../../view-model/logic/product-cubit/product_cubit.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    prodCubit(context).getCat();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return BlocConsumer<ProductCubit, ProductState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors().orange.withOpacity(0.2),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: state is CategoryData|| prodCubit(context).categoryListModel !=null
                  ? SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      child: Text(
                        'categories'.tr(),
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                          color: appCubit(context).dark
                              ? AppColors().white
                              : AppColors().black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: prodCubit(context)
                            .categoryListModel!
                            .categories
                            .length,
                        itemBuilder: (context, index) {
                          final categoryName = prodCubit(context)
                              .categoryListModel!
                              .categories[index]
                              .toString();
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              color: appCubit(context).dark
                                  ? Colors.grey[900]
                                  : Colors.white,
                              child: ListTile(

                                leading: Icon(
                                  Icons.category,
                                  size: 28.r,
                                  color: AppColors().orange,
                                ),
                                title: Text(
                                  categoryName[0].toUpperCase() +
                                      categoryName
                                          .substring(1)
                                          .replaceAll("-", " "),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: appCubit(context).dark
                                        ? AppColors().white
                                        : AppColors().black,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18.r,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  prodCubit(context).getCatProdList(
                                    categoryName:
                                    prodCubit(context)
                                        .categoryListModel!
                                        .categories[index]
                                        .toString(),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>  ProductListScreen(),
                                    ),
                                  );
                                },
                                onLongPress: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: AppColors().orange,
                ),
              ),
            );
          },
          listener: (context, state) {
            // Listen for ProductData state and navigate

          },
        );
      },
      listener: (context, state) {},
    );
  }
}
