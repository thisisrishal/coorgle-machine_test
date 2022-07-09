import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/cart_controller.dart';
import 'AppConstants.dart/constants.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Obx(
          () => AnimationLimiter(
            child: GridView.count(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.all(6.sp),
              crossAxisCount: 2,
              children: List.generate(
                cartC.cartList.value.length,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        child: Card(
                          margin: const EdgeInsets.all(6),
                          child: Container(
                            padding: EdgeInsets.only(left: 6.sp, right: 6.sp),
                            decoration: BoxDecoration(
                                color: AppColor.kLightBlue.withOpacity(.5),
                                borderRadius: BorderRadius.circular(4.sp)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.sp, horizontal: 2.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 20.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: customBorderRadius4,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                cartC.cartList[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                  AppSize.kSizedBox10h,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardText(
                                          text: cartC.cartList[index].title,
                                          fontSize: 13.sp,
                                          width: 20.w),
                                      AppSize.kSizedBox10w,
                                      // CardText(

                                      //     text: 'Qty : ${cartC.cartList[index].count}',
                                      //     fontSize: 13.sp,
                                      //     width: 10.w),
                                    ],
                                  ),
                                  AppSize.kSizedBox10h,
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      LineThroughText(
                                        text:
                                            '\$${cartC.cartList[index].price.toString()}',
                                        fontSize: 13.sp,
                                      ),
                                      AppSize.kSizedBox10w,
                                      Container(
                                        child: CardText(
                                          width: 20.w,
                                          text:
                                              '\$${cartC.cartList[index].offerPrice.toString()}',
                                          fontSize: 13.sp,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          cartC.removeFromCart(
                                              cartC.cartList[index]);
                                        },
                                        child: const Icon(Icons.delete_outline),
                                      ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
