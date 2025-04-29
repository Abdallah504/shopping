part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class CategoryLoading extends ProductState{}
final class CategoryData extends ProductState{}
final class ProductLoading extends ProductState{}
final class ProductData extends ProductState{}
final class ProductDetailLoading extends ProductState{}
final class ProductDetailData extends ProductState{}
