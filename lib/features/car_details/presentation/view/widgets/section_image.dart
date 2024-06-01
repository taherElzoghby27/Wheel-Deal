import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/car_details/presentation/view_model/changed_carsoul_cubit/changed_carsoul_cubit.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../../core/widgets/carsl_options.dart';

class SectionImages extends StatefulWidget {
  const SectionImages({super.key, required this.carModel});

  final CarEntity carModel;

  @override
  State<SectionImages> createState() => _SectionImagesState();
}

class _SectionImagesState extends State<SectionImages> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ChangedCarsoulCubit, ChangedCarsoulState>(
      listener: (context, state) {
        if (state is ChangedCrslState) {
          index = state.index;
        }
      },
      builder: (context, state) {
        ChangedCarsoulCubit bloc = context.read<ChangedCarsoulCubit>();
        List<String> cars = [
          widget.carModel.image,
          widget.carModel.image,
          widget.carModel.image,
        ];
        return Column(
          children: [
            SizedBox(height: size.height * .015),
            CarouselSlider(
              items: cars
                  .map(
                    (image) => AspectRatio(
                      aspectRatio: AppConsts.aspectRatio16on11,
                      child: SizedBox(
                        //height: size.height,
                        child: ClipRRect(
                          borderRadius: AppConsts.mainRadius,
                          child: HandleImageWidget(image: image),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: carouselOption(
                size.height * .3,
                onPageChanged: (index, carouselPageChangedReason) =>
                    bloc.changeCarsoulIndex(index),
              ),
            ),
            SizedBox(height: size.height * .015),
            PageViewDotIndicator(
              currentItem: index,
              count: cars.length,
              unselectedColor: AppConsts.mainColor.withOpacity(.5),
              selectedColor: AppConsts.mainColor,
              size: Size(size.width * .06.w, size.height * .008.h),
              unselectedSize: Size(size.width * .02.w, size.height * .01.h),
              alignment: Alignment.center,
              boxShape: BoxShape.rectangle,
              //defaults to circle
              borderRadius: BorderRadius.circular(5),
              //only for rectangle shape
              onItemClicked: (index) => bloc.changeCarsoulIndex(index),
            )
          ],
        );
      },
    );
  }
}
