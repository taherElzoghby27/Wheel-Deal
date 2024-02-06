import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/indicator_widget.dart';
import 'package:cars/features/onBoarding/presentation/view/widgets/board_structure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          children: [
            BoardStructure(
              image: Assets.imagesBoard1,
              subTitle: StringsEn.subTitleBoard1,
              titles: [
                TextSpan(text: StringsEn.titleBoard1),
                TextSpan(
                  text: StringsEn.titleBoard11,
                  style: const TextStyle(color: AppConsts.primary500),
                ),
                TextSpan(text: StringsEn.titleBoard111),
              ],
            ),
            BoardStructure(
              image: Assets.imagesBoard2,
              titles: [
                TextSpan(text: StringsEn.titleBoard2),
                TextSpan(
                  text: StringsEn.titleBoard22,
                  style: const TextStyle(color: AppConsts.primary500),
                ),
              ],
              subTitle: StringsEn.subTitleBoard3,
            ),
            BoardStructure(
              image: Assets.imagesBoard3,
              titles: [
                TextSpan(text: StringsEn.titleBoard3),
                TextSpan(
                  text: StringsEn.titleBoard33,
                  style: const TextStyle(color: AppConsts.primary500),
                ),
                TextSpan(text: StringsEn.titleBoard333),
              ],
              subTitle: StringsEn.subTitleBoard3,
            ),
          ],
        ),

        ///appbar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * .1,
                child: Image.asset(Assets.imagesLogo),
              ),

              ///skip
              TextButton(
                onPressed: () => GoRouter.of(context).pushReplacement(authPath),
                child: const Text(StringsEn.skip, style: AppConsts.style16),
              ),
            ],
          ),
        ),

        ///indicator
        Positioned(
          width: size.width,
          bottom: size.height * .15.h,
          child: Align(
            alignment: Alignment.center,
            child: IndicatorWidget(currentPage: currentPage),
          ),
        ),

        ///next or get started
        Positioned(
          width: size.width,
          bottom: size.height * .07.h,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButton(
                  text:
                      currentPage == 2 ? StringsEn.getStarted : StringsEn.next,
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
                      GoRouter.of(context).pushReplacement(authPath);
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
