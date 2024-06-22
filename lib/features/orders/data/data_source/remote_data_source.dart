import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/consts/api.dart';
import '../models/order_model.dart';

abstract class RemoteDataSourceOrderRepo {
  //get orders
  Future<List<OrderModel>> getOrders();

  //add order
  Future<String> addOrder({required String carId});

  //delete order
  Future<String> deleteOrder({required String carId});
}

class RemoteDataSourceOrderRepoImpl extends RemoteDataSourceOrderRepo {
  final ApiService _apiService;

  RemoteDataSourceOrderRepoImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<String> addOrder({required String carId}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    debugPrint("car id :$carId");
    FormData data = FormData.fromMap({'car_id': carId});
    Response response = await _apiService.post(
      endPoint: ApiConsts.addOrderEndPoint,
      token: token!,
      data: data,
    );
    String result = response.data['Message'];
    return result;
  }

  @override
  Future<String> deleteOrder({required String carId}) async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    FormData data = FormData.fromMap({'car_id': carId});
    Response response = await _apiService.post(
      endPoint: ApiConsts.deleteOrderEndPoint,
      token: token!,
      data: data,
    );
    String result = response.data['Message'];
    return result;
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    Response response = await _apiService.get(
      endPoint: ApiConsts.fetchOrdersEndPoint,
      token: token!,
    );
    List<OrderModel> orders = List<OrderModel>.from(
      (response.data['data'] as List<dynamic>).map(
        (order) => OrderModel.fromMap(order),
      ),
    );
    return orders;
  }
}
