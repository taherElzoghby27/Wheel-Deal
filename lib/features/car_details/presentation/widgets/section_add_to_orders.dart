import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/orders/presentation/manager/order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionAddToOrders extends StatelessWidget {
  const SectionAddToOrders({super.key, required this.carId});

  final String carId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioButtonAuth,
        child: BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state.addOrderState == RequestState.loaded) {
              showSnack(context, message: state.resultAddOrder);
            } else if (state.addOrderState == RequestState.failure) {
              showSnack(
                context,
                message: state.failureAddOrderMessage,
                backGroundColor: AppConsts.danger500,
              );
            }
          },
          builder: (context, state) {
            return Visibility(
              replacement: const LoadingWidget(),
              visible:
                  state.addOrderState == RequestState.loading ? false : true,
              child: CustomButton(
                text: StringsEn.addToOrders,
                onTap: () => context.read<OrderCubit>().addOrder(carId),
                styleText: AppConsts.style16White,
              ),
            );
          },
        ),
      ),
    );
  }
}
