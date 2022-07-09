import 'package:coorgle_machine_test/controller/cart_controller.dart';
import 'package:coorgle_machine_test/view/AppConstants.dart/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'AppConstants.dart/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final cartC = Get.put(CartController());

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(6.sp),
          crossAxisCount: 2,
          children: List.generate(
            Products.length,
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
                                            Products[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              AppSize.kSizedBox10h,
                              CardText(
                                  text: Products[index].title,
                                  fontSize: 13.sp,
                                  width: 55.w),
                              AppSize.kSizedBox10h,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  LineThroughText(
                                    text:
                                        '\$${Products[index].price.toString()}',
                                    fontSize: 13.sp,
                                  ),
                                  AppSize.kSizedBox10w,
                                  Container(
                                    child: CardText(
                                      width: 20.w,
                                      text:
                                          '\$${Products[index].offerPrice.toString()}',
                                      fontSize: 13.sp,
                                      // color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      cartC.getCartList();
                                      cartC.addToCart(
                                          Products[index]);
                                    },
                                    child: const Icon(
                                        Icons.add_shopping_cart_outlined),
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
    );
  }
}
