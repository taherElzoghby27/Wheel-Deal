import 'package:cars/features/chats/presentation/view/chats_view.dart';
import 'package:cars/features/orders/presentation/view/orders_view.dart';
import 'package:cars/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/home_view.dart';

//screens
List<Widget> screens = const [
  HomeView(),
  OrdersView(),
  ChatsView(),
  ProfileView(),
];
