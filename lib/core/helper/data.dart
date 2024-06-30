import 'package:cars/core/helper/strings.dart';
import 'package:cars/features/car_details/data/models/car_feature_model.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:cars/features/chats/data/models/chat_model.dart';
import 'package:cars/features/chats/presentation/view/chat_view.dart';
import 'package:cars/features/favourites/presentation/view/favourites_view_bloc_provider.dart';
import 'package:cars/features/orders/presentation/view/orders_view_bloc_provider.dart';
import 'package:cars/features/profile/data/models/identity_type_model.dart';
import 'package:cars/features/profile/presentation/view/profile_view_bloc_provider.dart';
import 'package:flutter/material.dart';

import '../../features/car_details/data/models/car_specification_model.dart';
import '../../features/chats/data/models/message_model.dart';
import '../../features/home/presentation/view/home_view_bloc_provider.dart';
import '../../features/on_boarding/presentation/view/widgets/board_structure.dart';
import '../models/car_model.dart';
import 'assets.dart';

List<BoardStructure> boards = [
  BoardStructure(
    image: Assets.imagesBoard1,
    subTitle: StringsEn.subTitleBoard1,
    title: StringsEn.titleBoard1,
  ),
  BoardStructure(
    image: Assets.imagesBoard2,
    title: StringsEn.titleBoard2,
    subTitle: StringsEn.subTitleBoard3,
  ),
  BoardStructure(
    image: Assets.imagesBoard3,
    title: StringsEn.titleBoard3,
    subTitle: StringsEn.subTitleBoard3,
  ),
];
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
  HomeViewBlocProvider(),
  FavouritesViewBlocProvider(),
  OrdersView(),
  ChatView(),
  ProfileView(),
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
  Message(
      id: 2,
      message:
          'Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!Of course, I can!',
      time: '10:21'),
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

List<CarSpecificModel> listOfSpecification(CarModel carModel) {
  return [
    CarSpecificModel(
      key: StringsEn.bodyType,
      value: carModel.bodyType!,
      icon: Assets.bodyType,
    ),
    CarSpecificModel(
      key: StringsEn.fuelType,
      value: carModel.fuelType!,
      icon: Assets.fuelType,
    ),
    CarSpecificModel(
      key: StringsEn.transimmision,
      value: carModel.transmission!,
      icon: Assets.transimission,
    ),
    CarSpecificModel(
      key: StringsEn.enginePower,
      value: '${carModel.enginePower!} cc',
      icon: Assets.enginePower,
    ),
    CarSpecificModel(
      key: StringsEn.topSpeed,
      value: '${carModel.topSpeed} mph',
      icon: Assets.topSpeed,
    ),
    CarSpecificModel(
      key: StringsEn.topCapacity,
      value: '${carModel.fuelTankCapacity} Liters',
      icon: Assets.topCapacity,
    ),
    CarSpecificModel(
      key: StringsEn.releaseDate,
      value: carModel.releaseDate!.toString(),
      icon: Assets.releaseDate,
    ),
  ];
}

List<CarFeatureModel> listOfFeatures(CarModel carModel) => [
      CarFeatureModel(
        key: StringsEn.airCondition,
        value: carModel.airConditioner == '1' ? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.airbag,
        value: carModel.brakeAssist == '1'? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.breakAssist,
        value: carModel.brakeAssist == '1' ? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.navigationSystem,
        value: carModel.navigationSystem == '1' ? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.touchScreen,
        value: carModel.touchScreen == '1' ? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.connectivity,
        value: carModel.connectivity == '1' ? true : false,
      ),
      CarFeatureModel(
        key: StringsEn.remoteEngine,
        value: carModel.remoteEngineStartStop == '1' ? true : false,
      ),
    ];
List<InstallmentAvailableModel> installments = [
  InstallmentAvailableModel(
    installmentPlan: '12',
    deposit: '266266',
    monthly: '266266',
    total: '266266',
  ),
  InstallmentAvailableModel(
    installmentPlan: '24',
    deposit: '266266',
    monthly: '266266',
    total: '266266',
  ),
  InstallmentAvailableModel(
    installmentPlan: '36',
    deposit: '266266',
    monthly: '266266',
    total: '266266',
  ),
  InstallmentAvailableModel(
    installmentPlan: '48',
    deposit: '266266',
    monthly: '266266',
    total: '266266',
  ),
  InstallmentAvailableModel(
    installmentPlan: '60',
    deposit: '266266',
    monthly: '266266',
    total: '266266',
  ),
];
List<IdentityTypeModel> identities = [
  IdentityTypeModel(type: StringsEn.idCard),
  IdentityTypeModel(type: StringsEn.passport),
  IdentityTypeModel(type: StringsEn.drivingLicense),
];
