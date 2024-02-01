import 'package:cars/features/chats/presentation/view/chats_view.dart';
import 'package:cars/features/orders/presentation/view/orders_view.dart';
import 'package:cars/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/home_view.dart';
import 'assets.dart';

//screens
List<Widget> screens = const [
  HomeView(),
  OrdersView(),
  ChatsView(),
  ProfileView(),
];
List<String> cars = [Assets.car1, Assets.car2, Assets.car3];
