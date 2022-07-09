import 'package:coorgle_machine_test/main.dart';
import 'package:coorgle_machine_test/model/cart_model.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    getCartList();
    super.onInit();
  }

  var isCartItem = false.obs;

  final cartList = [].obs;

  addToCart(CartModel value) async {
    if (cartList.value.isEmpty) {
      cartList.value.add(value);
    } else {
      bool isExist = false;
      for (var i = 0; i < cartList.value.length; i++) {
        if (cartList.value[i].title == value.title) {
          cartList.value[i].count += value.count;
          isExist = true;
          break;
        }
      }
      if (!isExist) {
        cartList.value.add(value);
      }
    }
    box.put(value.title, value);
    getCartList();
    update();
  }

  removeFromCart(CartModel value) async {
    box.delete(value.title);
    getCartList();
    update();
  }

  getCartList() async {
    cartList.value = box.values.toList();
    update();
  }
}
