import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding4,
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatioComponentOrder.sp,
        child: Container(
          decoration: AppConsts.mainDecoration,
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
                      child: const HandleImageWidget(
                        image:
                            'https://cloudfront-eu-central-1.images.arcpublishing.com/diarioas/RYX545TZURAGPJAQRKHQBUVIJU.jpg',
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
                                'BMW 320i M Sport',
                                style: AppConsts.style16White.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'EGP 3,000,000',
                                style: AppConsts.style14.copyWith(
                                  color: AppConsts.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 21,
                                child: CustomButton(
                                  text: StringsEn.trackOrder,
                                  onTap: () {},
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
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
