import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  CartModel(
      {required this.title,
      required this.size,
      required this.color,
      required this.count,
      required this.offerPrice,
      required this.price,
      required this.image});

  @HiveField(0)
  late String title;

  @HiveField(1)
  late String size;

  @HiveField(2)
  late String color;

  @HiveField(3)
  late int count;

  @HiveField(4)
  late double offerPrice;

  @HiveField(5)
  late double price;

  @HiveField(6)
  late String image;

  


}
