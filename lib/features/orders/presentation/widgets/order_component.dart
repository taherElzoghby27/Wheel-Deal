import 'package:cars/core/helper/methods.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/orders/presentation/manager/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/order_model.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding4,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioComponentOrder.sp,
        child: Container(
          decoration: AppConsts.mainDecoration.copyWith(
            border: Border.all(
              color: Theme.of(context).canvasColor.withOpacity(.1),
            ),
          ),
          child: Padding(
            padding: AppConsts.padding8H3V,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspectRatioImage.sp,
                      child: HandleImageWidget(
                        image: order.imagePath,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: AppConsts.mainPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order.brand} ${order.model}',
                                style: AppConsts.style16White.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).canvasColor,
                                ),
                              ),
                              Text(
                                'EGP ${handlePrice(order.price)}',
                                style: AppConsts.style14.copyWith(
                                  color: AppConsts.mainColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const Spacer(flex: 10),
                              IconButton(
                                onPressed: () =>
                                    context.read<OrderCubit>().deleteOrder(
                                          order,
                                        ),
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(.5),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
