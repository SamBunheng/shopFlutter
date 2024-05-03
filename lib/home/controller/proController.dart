import 'package:shop/home/model/product.dart';

class ProController{
  List<ProductModel> listCart = <ProductModel>[];
  void addCart(ProductModel model){
    listCart.add(model);
  }
  void removeCart(ProductModel model){
    listCart.remove(model);
  }
}
