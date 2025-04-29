import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view-model/logic/app-cubit/app_cubit.dart';
import 'package:shopping/view-model/logic/product-cubit/product_cubit.dart';
import 'package:shopping/view/screens/product-list-screen.dart';

class ProductDetailScreen extends StatefulWidget {


  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          return BlocConsumer<ProductCubit,ProductState>(
              builder: (context,state){
                return Scaffold(
                  appBar:prodCubit(context).productDetailModel!=null? AppBar(
                    title: Text(prodCubit(context).productDetailModel!.title ?? 'Product Details',
                    style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                    ),
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
                  ):null,
                  body:prodCubit(context).productDetailModel!=null? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Images Carousel
                        if (prodCubit(context).productDetailModel!.images != null && prodCubit(context).productDetailModel!.images!.isNotEmpty)
                          CarouselSlider(
                            options: CarouselOptions(height: 250.0, enlargeCenterPage: true,
                              autoPlay: true,
                            ),
                            items: prodCubit(context).productDetailModel!.images!.map((img) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(img, fit: BoxFit.cover, width: double.infinity),
                              );
                            }).toList(),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// Title, Brand, Category
                              Text(prodCubit(context).productDetailModel!.title ?? '', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                              color: appCubit(context).dark==false? AppColors().black:AppColors().white
                              )),
                              SizedBox(height: 4),
                              Text("Brand: ${prodCubit(context).productDetailModel!.brand}", style: TextStyle(color:appCubit(context).dark==false? Colors.grey[700]:AppColors().white )),
                              Text("Category: ${prodCubit(context).productDetailModel!.category}", style: TextStyle(color: appCubit(context).dark==false? Colors.grey[700]:AppColors().white)),

                              SizedBox(height: 12),

                              /// Price and Discount
                              Row(
                                children: [
                                  Text("\$${prodCubit(context).productDetailModel!.price}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: appCubit(context).dark==false? AppColors().black:AppColors().white)),
                                  SizedBox(width: 10),
                                  if (prodCubit(context).productDetailModel!.discountPercentage != null)
                                    Text("-${prodCubit(context).productDetailModel!.discountPercentage!.toStringAsFixed(1)}%",
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                ],
                              ),

                              /// Rating
                              if (prodCubit(context).productDetailModel!.rating != null)
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text("${prodCubit(context).productDetailModel!.rating} / 5",style: TextStyle(
                                      color: appCubit(context).dark==false? AppColors().black:AppColors().white
                                    ),),
                                  ],
                                ),

                              SizedBox(height: 16),

                              /// Description
                              Text("Description", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,
                              color: appCubit(context).dark==false? AppColors().black:AppColors().white
                              )),
                              SizedBox(height: 8),
                              Text(prodCubit(context).productDetailModel!.description ?? '',
                              style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),
                              ),

                              SizedBox(height: 16),

                              /// Specifications
                              Text("Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                              color: appCubit(context).dark==false? AppColors().black:AppColors().white
                              )),
                              Divider(),
                              _buildSpecRow("SKU", prodCubit(context).productDetailModel!.sku),
                              _buildSpecRow("Weight", "${prodCubit(context).productDetailModel!.weight}g"),
                              _buildSpecRow("Dimensions", prodCubit(context).productDetailModel!.dimensions != null
                                  ? "${prodCubit(context).productDetailModel!.dimensions!.width} x ${prodCubit(context).productDetailModel!.dimensions!.height} x ${prodCubit(context).productDetailModel!.dimensions!.depth}"
                                  : "N/A"),
                              _buildSpecRow("Stock", prodCubit(context).productDetailModel!.stock.toString()),
                              _buildSpecRow("Availability", prodCubit(context).productDetailModel!.availabilityStatus),
                              _buildSpecRow("Shipping Info", prodCubit(context).productDetailModel!.shippingInformation),
                              _buildSpecRow("Warranty", prodCubit(context).productDetailModel!.warrantyInformation),
                              _buildSpecRow("Return Policy", prodCubit(context).productDetailModel!.returnPolicy),

                              SizedBox(height: 16),

                              /// Tags
                              if (prodCubit(context).productDetailModel!.tags != null && prodCubit(context).productDetailModel!.tags!.isNotEmpty)
                                Wrap(
                                  spacing: 8,
                                  children: prodCubit(context).productDetailModel!.tags!
                                      .map((tag) => Chip(label: Text(tag,style: TextStyle(color: appCubit(context).dark==false? AppColors().black:AppColors().white),)))
                                      .toList(),
                                ),

                              SizedBox(height: 16),

                              /// Reviews
                              if (prodCubit(context).productDetailModel!.reviews != null && prodCubit(context).productDetailModel!.reviews!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: appCubit(context).dark==false? AppColors().black:AppColors().white)),
                                    ...prodCubit(context).productDetailModel!.reviews!.map((review) => ListTile(
                                      title: Text(review.reviewerName ?? "Anonymous",style: TextStyle(
                                        color: appCubit(context).dark==false? AppColors().black:AppColors().white
                                      ),),
                                      subtitle: Text(review.comment ?? "",style: TextStyle(
                                        color: appCubit(context).dark==false? AppColors().black:AppColors().white
                                      ),),
                                      trailing: Text("${review.rating}★",style: TextStyle(
                                        color: appCubit(context).dark==false? AppColors().black:AppColors().white
                                      ),),
                                    ))
                                  ],
                                ),

                              SizedBox(height: 20),

                              /// Action Buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors().orange
                                      ),// Add to Cart
                                      child: Text("Add to Cart",style: TextStyle(color: AppColors().white),),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors().orange
                                      ),
                                      onPressed: () {}, // Buy Now
                                      child: Text("Buy Now",style: TextStyle(color: AppColors().white),),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ): Center(
                    child: CircularProgressIndicator(
                      color: AppColors().orange,
                    ),
                  ),
                );
              },
              listener: (context,state){});
        },
        listener: (context,state){});
  }

  Widget _buildSpecRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(label, style: TextStyle(fontWeight: FontWeight.w600,color: appCubit(context).dark==false? AppColors().black:AppColors().white))),
          Expanded(flex: 5, child: Text(value ?? '-', style: TextStyle(color:appCubit(context).dark==false? Colors.grey[700]:AppColors().white))),
        ],
      ),
    );
  }
}
