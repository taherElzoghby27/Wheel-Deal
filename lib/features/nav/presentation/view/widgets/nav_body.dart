import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
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
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 12,
        shadowColor: Theme.of(context).canvasColor,
        child: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 0
                      ? AppConsts.mainColor
                      : Theme.of(context).canvasColor.withOpacity(.3),
                  label: StringsEn.home,
                  icon: Icons.home,
                  onTap: () => blocNav.changeIndex(0),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 1
                      ? AppConsts.mainColor
                      : Theme.of(context).canvasColor.withOpacity(.3),
                  icon: Icons.favorite_outlined,
                  label: StringsEn.favourites,
                  onTap: () => blocNav.changeIndex(1),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 2
                      ? AppConsts.mainColor
                      : Theme.of(context).canvasColor.withOpacity(.3),
                  icon: Icons.shopping_cart,
                  label: StringsEn.orders,
                  onTap: () => blocNav.changeIndex(2),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 3
                      ? AppConsts.mainColor
                      : Theme.of(context).canvasColor.withOpacity(.3),
                  icon: Icons.chat,
                  label: StringsEn.chat,
                  onTap: () => blocNav.changeIndex(3),
                ),
                BottomNavBarWidget(
                  color: blocNav.currentIndex == 4
                      ? AppConsts.mainColor
                      : Theme.of(context).canvasColor.withOpacity(.3),
                  icon: Icons.person,
                  label: StringsEn.profile,
                  onTap: () => blocNav.changeIndex(4),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
