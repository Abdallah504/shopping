import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping/view-model/data/online/repo.dart';
import 'package:shopping/view/screens/product-list-screen.dart';

import '../../../model/categories-list-model.dart';
import '../../../model/prod-detail-model.dart';
import '../../../model/product-list-model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Repository repository;
  static ProductCubit get(context) => BlocProvider.of(context);
  ProductCubit(this.repository) : super(ProductInitial());
  CategoryListModel? categoryListModel;
  ProductListModel? productListModel;
  ProductDetailModel?productDetailModel;

  Future<void>getCat()async{
    emit(CategoryLoading());
    try{
      await repository.categoriesListData().then((value){
        if(value !=null){
          print(value);
          categoryListModel = CategoryListModel.fromJson(value.data);
          emit(CategoryData());
        }
      });
    }catch(e){
      print('Error ================> $e');
    }
  }
  Future<void>getCatProdList({required String categoryName,context})async{
    emit(ProductLoading());
    try{
      await repository.categoriesProductList(categoryName: categoryName).then((value){
        if(value !=null){
          print(value);
          productListModel = ProductListModel.fromJson(value.data);
          emit(ProductData());
        }
      });
    }catch(e){
      print('Error ================> $e');
    }
  }
  Future<void>getProdDetail({required int id})async{
    emit(ProductDetailLoading());
    try{
      await repository.prodDetailData(id: id).then((value){
        if(value !=null){
          print(value);
          productDetailModel = ProductDetailModel.fromJson(value.data);
          emit(ProductDetailData());
        }
      });
    }catch(e){
      print('Error ================> $e');
    }
  }


}
