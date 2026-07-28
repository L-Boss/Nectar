import 'package:get/get.dart';
import 'package:google_test_app/data/app_strings/app_asset_paths.dart';
import 'package:google_test_app/model/category_model/category_model.dart';
import 'package:google_test_app/model/product_model/product_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var categoryList = <CategoryModel>[].obs;
  var groceriesList = <CategoryModel>[].obs;
  var productQuantities = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadMockProducts();
    category();
    groceries();
  }

  int getProductQuantity(String productName) {
    return productQuantities[productName] ?? 1;
  }

  void updateProductQuantity(String productName, int newQuantity) {
    productQuantities[productName] = newQuantity;
  }

  void groceries() {
    groceriesList.assignAll([
      CategoryModel(categoryName: "Pulses", image: AppAssetPaths.category1),
      CategoryModel(categoryName: "Rice", image: AppAssetPaths.category2),
    ]);
  }

  void category() {
    categoryList.assignAll([
      CategoryModel(
        categoryName: "Fresh Fruits & Vegetables",
        image: AppAssetPaths.category1,
      ),
      CategoryModel(
        categoryName: "Bakery & Snacks",
        image: AppAssetPaths.category4,
      ),
      CategoryModel(
        categoryName: "Meat & Fish",
        image: AppAssetPaths.category3,
      ),
      CategoryModel(
        categoryName: "Dairy & Eggs",
        image: AppAssetPaths.category5,
      ),

      CategoryModel(
        categoryName: "Cooking Oil & Ghee",
        image: AppAssetPaths.category2,
      ),
      CategoryModel(categoryName: "Beverages", image: AppAssetPaths.category6),
    ]);
  }

  void loadMockProducts() {
    productList.assignAll([
      ProductModel(
        image: AppAssetPaths.fruit1,
        name: 'Running Shoes',
        description: 'Comfortable sports shoes',
        price: '49.99',
      ),
      ProductModel(
        image: AppAssetPaths.fruit1,
        name: 'Smart Watch',
        description: 'Waterproof with heart monitor',
        price: '129.99',
      ),
      ProductModel(
        image: AppAssetPaths.fruit1,
        name: 'Smart Watch',
        description: 'Waterproof with heart monitor',
        price: '129.99',
      ),
      ProductModel(
        image: AppAssetPaths.fruit1,
        name: 'Smart Watch',
        description: 'Waterproof with heart monitor',
        price: '129.99',
      ),
      ProductModel(
        image: AppAssetPaths.fruit1,
        name: 'Smart Watch',
        description: 'Waterproof with heart monitor',
        price: '129.99',
      ),
    ]);
  }

  void handleAddToCart(ProductModel product) {
    int selectedQty = getProductQuantity(product.name);
    Get.snowflakeSnackbar(
      'Cart',
      '${product.name} ($selectedQty) added to cart!',
    );
  }
}

extension on GetInterface {
  void snowflakeSnackbar(String s, String t) {}
}
