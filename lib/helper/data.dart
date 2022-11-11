import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];
  categories.add(const CategoryModel(
    categoryName: "Business",
    imageUrl:
        "https://images.unsplash.com/photo-1508385082359-f38ae991e8f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
  ));
  categories.add(const CategoryModel(
    categoryName: "Entertainment",
    imageUrl:
        "https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2312&q=80",
  ));
  categories.add(const CategoryModel(
    categoryName: "Health",
    imageUrl:
        "https://images.unsplash.com/photo-1494597564530-871f2b93ac55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2013&q=80",
  ));
  categories.add(const CategoryModel(
    categoryName: "Science",
    imageUrl:
        "https://images.unsplash.com/photo-1416816901131-9e5eab64c1c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80",
  ));
  categories.add(const CategoryModel(
    categoryName: "Sports",
    imageUrl:
        "https://images.unsplash.com/photo-1484482340112-e1e2682b4856?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2352&q=80",
  ));
  categories.add(const CategoryModel(
    categoryName: "Technology",
    imageUrl:
        "https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2338&q=80",
  ));
  return categories;
}



