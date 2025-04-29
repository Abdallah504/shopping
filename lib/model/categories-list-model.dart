class CategoryListModel {
  final List<String> categories;

  CategoryListModel({required this.categories});

  factory CategoryListModel.fromJson(List<dynamic> json) {
    return CategoryListModel(
      categories: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    return categories;
  }
}
