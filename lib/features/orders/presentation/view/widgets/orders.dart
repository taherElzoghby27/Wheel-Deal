import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/models/order_model.dart';
import 'package:flutter/material.dart';

import 'order_component.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final GlobalKey<AnimatedListState> keyList = GlobalKey<AnimatedListState>();
  List<Widget> ordersWidget = [];
  List<OrderModel> orders = [];

  @override
  void initState() {
    //waiting & scheduling
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => addOrders());
    super.initState();
  }

  //add jobs
  addOrders() {
    orders.addAll([
      OrderModel(image:'https://cloudfront-eu-central-1.images.arcpublishing.com/diarioas/RYX545TZURAGPJAQRKHQBUVIJU.jpg', name: 'BMW 320i M Sport', price: 300000),
      OrderModel(image: Assets.car2, name: 'BMW 320i M Sport', price: 300400),
      OrderModel(image: Assets.car3, name: 'BMW 320i M Sport', price: 600000),
      OrderModel(image: Assets.car1, name: 'BMW 320i M Sport', price: 300000),
      OrderModel(image: Assets.car2, name: 'BMW 320i M Sport', price: 300400),
      OrderModel(image: Assets.car3, name: 'BMW 320i M Sport', price: 600000),
      OrderModel(image: Assets.car1, name: 'BMW 320i M Sport', price: 300000),
      OrderModel(image: Assets.car2, name: 'BMW 320i M Sport', price: 300400),
      OrderModel(image: Assets.car3, name: 'BMW 320i M Sport', price: 600000),
      OrderModel(image: Assets.car1, name: 'BMW 320i M Sport', price: 300000),
      OrderModel(image: Assets.car2, name: 'BMW 320i M Sport', price: 300400),
      OrderModel(image: Assets.car3, name: 'BMW 320i M Sport', price: 600000),

    ]);
    Future future = Future(() {});
    for (var order in orders) {
      future = future.then(
        (value) => Future.delayed(const Duration(milliseconds: 100)).then(
          (value) {
            ordersWidget.add(_buildWidget(order));
            keyList.currentState!.insertItem(ordersWidget.length - 1);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: keyList,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        Tween<double> opacity = Tween(begin: 0.0, end: 1.0);
        //get item from left
        Tween<Offset> offsetOdd = Tween(
          begin: const Offset(-1, -1),
          end: const Offset(0, 0),
        );
        //get item from right
        Tween<Offset> offsetEven = Tween(
          begin: const Offset(1, 1),
          end: const Offset(0, 0),
        );
        return FadeTransition(
          opacity: animation.drive(opacity),
          child: SlideTransition(
            position: animation.drive(
              index % 2 == 0 ? offsetEven : offsetOdd,
            ),
            child: ordersWidget[index],
          ),
        );
      },
      initialItemCount: ordersWidget.length,
    );
  }

//build widget
  Widget _buildWidget(OrderModel order) {
    return const OrderComponent();
  }
}
