import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/car_details/data/models/car_feature_model.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:cars/features/chats/data/models/chat_model.dart';
import 'package:cars/features/chats/presentation/view/chat_view.dart';
import 'package:cars/features/favourites/presentation/view/favourites_view.dart';
import 'package:cars/features/orders/presentation/view/orders_view.dart';
import 'package:cars/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

import '../../features/car_details/data/models/car_specification_model.dart';
import '../../features/chats/data/models/message_model.dart';
import '../../features/home/presentation/view/home_view.dart';
import 'assets.dart';

List<TweenSequenceItem<Offset>> itemsSequences = <TweenSequenceItem<Offset>>[
  TweenSequenceItem(
    tween: Tween(begin: const Offset(0, 0), end: const Offset(-.04, 0)),
    weight: 25,
  ),
  TweenSequenceItem(
    tween: Tween(begin: const Offset(-.04, 0), end: const Offset(0, 0)),
    weight: 25,
  ),
  TweenSequenceItem(
    tween: Tween(begin: const Offset(0, 0), end: const Offset(.04, 0)),
    weight: 25,
  ),
  TweenSequenceItem(
    tween: Tween(begin: const Offset(.04, 0), end: const Offset(0, 0)),
    weight: 25,
  ),
];
//screens
List<Widget> screens = const [
  HomeView(),
  FavouritesView(),
  OrdersView(),
  ChatView(),
  ProfileView(),
];
List<String> cars = [
  'https://www.usnews.com/object/image/0000018d-3d71-df19-abbd-3d7771dd0000/p90509760-1.jpeg?update-time=1706132861051&size=responsiveGallery',
  'https://www.motortrend.com/uploads/2023/01/2024-BMW-M3-CS-29.png',
  'https://alicanteplaza.es/public/Image/2022/11/ElnuevoBMWX1llegaalmercadoespa%C3%B1ol_NoticiaAmpliada.jpg',
];
List<Message> messagesLists = [
  Message(
      id: 1,
      message:
          """Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.""",
      time: '10:21'),
  Message(
      id: 2,
      message:
          """Hi Melan, thank you for considering me, this is good news for me.""",
      time: '10:21'),
  Message(
      id: 1,
      message: 'Can we have an interview via google meet call today at 3pm?',
      time: '10:21'),
  Message(id: 2, message: 'Of course, I can!', time: '10:21'),
  Message(
      id: 1,
      message:
          """Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.""",
      time: '10:21'),
  Message(
      id: 2,
      message:
          """Hi Melan, thank you for considering me, this is good news for me.""",
      time: '10:21'),
  Message(
      id: 1,
      message: 'Can we have an interview via google meet call today at 3pm?',
      time: '10:21'),
  Message(id: 2, message: 'Of course, I can!', time: '10:01'),
  Message(
      id: 1,
      message:
          """Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.""",
      time: '10:21'),
  Message(
      id: 2,
      message:
          """Hi Melan, thank you for considering me, this is good news for me.""",
      time: '10:21'),
  Message(
      id: 1,
      message: 'Can we have an interview via google meet call today at 3pm?',
      time: '10:21'),
  Message(id: 2, message: 'Of course, I can!', time: '10:21'),
  Message(
      id: 1,
      message:
          """Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.""",
      time: '10:21'),
  Message(
      id: 2,
      message:
          """Hi Melan, thank you for considering me, this is good news for me.""",
      time: '10:21'),
  Message(
      id: 1,
      message: 'Can we have an interview via google meet call today at 3pm?',
      time: '10:21'),
  Message(id: 2, message: 'Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!', time: '10:21'),
];

List<Chat> chatsList = [
  Chat(
    logo:
        'https://w7.pngwing.com/pngs/421/879/png-transparent-twitter-logo-social-media-iphone-organization-logo-twitter-computer-network-leaf-media.png',
    name: 'Twitter',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '10:32',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
    name: 'Facebook',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '09:02',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
    name: 'Instagram',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '07:02',
  ),
  Chat(
    logo:
        'https://w7.pngwing.com/pngs/421/879/png-transparent-twitter-logo-social-media-iphone-organization-logo-twitter-computer-network-leaf-media.png',
    name: 'Twitter',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '10:32',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
    name: 'Facebook',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '09:02',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
    name: 'Instagram',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '07:02',
  ),
  Chat(
    logo:
        'https://w7.pngwing.com/pngs/421/879/png-transparent-twitter-logo-social-media-iphone-organization-logo-twitter-computer-network-leaf-media.png',
    name: 'Twitter',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '10:32',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
    name: 'Facebook',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '09:02',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
    name: 'Instagram',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '07:02',
  ),
  Chat(
    logo:
        'https://w7.pngwing.com/pngs/421/879/png-transparent-twitter-logo-social-media-iphone-organization-logo-twitter-computer-network-leaf-media.png',
    name: 'Twitter',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '10:32',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
    name: 'Facebook',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '09:02',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
    name: 'Instagram',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '07:02',
  ),
  Chat(
    logo:
        'https://w7.pngwing.com/pngs/421/879/png-transparent-twitter-logo-social-media-iphone-organization-logo-twitter-computer-network-leaf-media.png',
    name: 'Twitter',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '10:32',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png',
    name: 'Facebook',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '09:02',
  ),
  Chat(
    logo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/600px-Instagram_icon.png',
    name: 'Instagram',
    lastMessage: 'Here is the link: http://zoom.com/abcdeefg',
    time: '07:02',
  ),
];
List<Map<String, dynamic>> brands = [
  {
    'brandName': 'Bmw',
    'Logo': 'https://kioslambang.files.wordpress.com/2010/10/logobmw.png',
  },
  {
    'brandName': 'Bmw',
    'Logo': 'https://kioslambang.files.wordpress.com/2010/10/logobmw.png',
  },
  {
    'brandName': 'Bmw',
    'Logo': 'https://kioslambang.files.wordpress.com/2010/10/logobmw.png',
  },
  {
    'brandName': 'Bmw',
    'Logo': 'https://kioslambang.files.wordpress.com/2010/10/logobmw.png',
  },
];
List<CarSpecificModel> specifications = [
  CarSpecificModel(
    key: StringsEn.bodyType,
    value: 'sedan',
    icon: Assets.bodyType,
  ),
  CarSpecificModel(
    key: StringsEn.fuelType,
    value: 'benzine',
    icon: Assets.fuelType,
  ),
  CarSpecificModel(
    key: StringsEn.transimmision,
    value: 'Automatic',
    icon: Assets.transimission,
  ),
  CarSpecificModel(
    key: StringsEn.enginePower,
    value: '3500 cc',
    icon: Assets.enginePower,
  ),
  CarSpecificModel(
    key: StringsEn.topSpeed,
    value: '149 mph',
    icon: Assets.topSpeed,
  ),
  CarSpecificModel(
    key: StringsEn.topCapacity,
    value: '60 Liters',
    icon: Assets.topCapacity,
  ),
  CarSpecificModel(
    key: StringsEn.releaseDate,
    value: '2022',
    icon: Assets.releaseDate,
  ),
];
List<CarFeatureModel> features = [
  CarFeatureModel(
    key: StringsEn.airCondition,
    value: true,
  ),
  CarFeatureModel(
    key: StringsEn.airbag,
    value: false,
  ),
  CarFeatureModel(
    key: StringsEn.breakAssist,
    value: true,
  ),
  CarFeatureModel(
    key: StringsEn.navigationSystem,
    value: true,
  ),
  CarFeatureModel(
    key: StringsEn.touchScreen,
    value: false,
  ),
  CarFeatureModel(
    key: StringsEn.connectivity,
    value: true,
  ),
  CarFeatureModel(
    key: StringsEn.remoteEngine,
    value: true,
  ),
];
List<InstallmentModel> installments = [
  InstallmentModel(
    months: 12,
    deposit: 266266,
    monthly: 266266,
    total: 266266,
  ),
  InstallmentModel(
    months: 24,
    deposit: 266266,
    monthly: 266266,
    total: 266266,
  ),
  InstallmentModel(
    months: 36,
    deposit: 266266,
    monthly: 266266,
    total: 266266,
  ),
  InstallmentModel(
    months: 48,
    deposit: 266266,
    monthly: 266266,
    total: 266266,
  ),
  InstallmentModel(
    months: 60,
    deposit: 266266,
    monthly: 266266,
    total: 266266,
  ),
];
