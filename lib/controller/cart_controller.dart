import 'package:coorgle_machine_test/model/cart_model.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  final cartList = Rx<List<CartModel>>([]);

  void addToCart(CartModel value) {
    cartList.value.add(value);
    // cartList.value.sort((a,b)=>a.title.compareTo(b.title));
    print(value.toString());
    update();
  }
}
