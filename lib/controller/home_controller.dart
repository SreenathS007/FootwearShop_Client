import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_client/models/product/product.dart';
import 'package:shopy_client/models/product_category.dart';

class HomeController extends GetxController {
  //creating an instance for handling database
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //products collection reference
  late CollectionReference productCollection;
//product Catewgory reference
  late CollectionReference catogoryCollection;
  List<Product> products = [];
  List<ProductCategory> productCategories = [];

  @override
  Future<void> onInit() async {
    //using this colliction we can add delete remove, update...
    productCollection = firestore.collection('Products');
    catogoryCollection = firestore.collection('category');
    await fetchCategory();
    await fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Product fetch Successfuly',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  fetchCategory() async {
    try {
      QuerySnapshot catogorySnapshot = await catogoryCollection.get();
      final List<ProductCategory> retrievedCategories = catogorySnapshot.docs
          .map((doc) =>
              ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productCategories.clear();
      productCategories.assignAll(retrievedCategories);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }
}
