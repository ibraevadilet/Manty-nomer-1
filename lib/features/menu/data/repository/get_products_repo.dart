import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

abstract class GetProductsRepo {
  Future<List<MantyModel>> getProducts();
}

class GetProductsRepoImpl implements GetProductsRepo {
  GetProductsRepoImpl();
  @override
  Future<List<MantyModel>> getProducts() async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('products');
    final products = await firestore.get();

    return products.docs
        .map<MantyModel>((e) => MantyModel.fromJson(e.data() as Map))
        .toList();
  }
}
