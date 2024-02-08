import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/nav/presentation/view/widgets/bottom_nav_bar_item.dart';
import 'package:cars/features/nav/presentation/view_model/nav_cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBody extends StatelessWidget {
  const NavBody({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarCubit blocNav = BlocProvider.of<NavBarCubit>(context);
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioNavBar,
      child: BottomAppBar(
        color: AppConsts.primary300,
        elevation: 7,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 0
                      ? AppConsts.neutral100
                      : AppConsts.neutral900,
                  label: StringsEn.home,
                  icon: Icons.home,
                  onTap: () => blocNav.changeIndex(0),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 1
                      ? AppConsts.neutral100
                      : AppConsts.neutral900,
                  icon: Icons.shopping_cart,
                  label: StringsEn.orders,
                  onTap: () => blocNav.changeIndex(1),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 2
                      ? AppConsts.neutral100
                      : AppConsts.neutral900,
                  icon: Icons.chat,
                  label: StringsEn.chat,
                  onTap: () => blocNav.changeIndex(2),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 3
                      ? AppConsts.neutral100
                      : AppConsts.neutral900,
                  icon: Icons.person,
                  label: StringsEn.profile,
                  onTap: () => blocNav.changeIndex(3),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
