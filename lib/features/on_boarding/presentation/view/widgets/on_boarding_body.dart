import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/data.dart';
import '../../../../../core/consts/style.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController pageController = PageController();
  int currentPage = 0;

  ///dispose page controller
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ///page view
        PageView(
          controller: pageController,
          onPageChanged: (int index) => setState(
            () => currentPage = index,
          ),
          children: boards,
        ),

        ///appbar
        Positioned(
          top: size.height * .01,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => GoRouter.of(context).pushReplacement(
                  loginPath,
                ),
                child: const Text(StringsEn.skip, style: AppConsts.style16),
              ),
            ),
          ),
        ),

        ///indicator
        Positioned(
          left: 0,
          right: 0,
          bottom: size.height * .15.h,
          child: Align(
            alignment: Alignment.center,
            child: IndicatorWidget(currentPage: currentPage),
          ),
        ),

        ///next or get started
        Positioned(
          left: 0,
          right: 0,
          bottom: size.height * .04.h,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
                child: CustomButton(
                  text:
                      currentPage == 2 ? StringsEn.getStarted : StringsEn.next,
                  styleText: AppConsts.style16.copyWith(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    if (currentPage == 0) {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else if (currentPage == 1) {
                      pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      GoRouter.of(context).pushReplacement(loginPath);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
