import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/tile_widget.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_list_grid_view.dart';
import 'section_facilities.dart';
import 'section_fields_filter.dart';
import 'section_price_range.dart';
import 'show_result_filter_button.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({super.key, required this.cars});

  final List<CarEntity> cars;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return cars.isEmpty
        ? Padding(
            padding: AppConsts.mainPadding,
            child: const Column(
              children: [
                SectionFieldsFilter(),
                AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
                SectionPriceRange(),
                AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
                SectionFacilities(),
                AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
                ShowResultFilterButton(),
              ],
            ),
          )
        : Column(
            children: [
              SizedBox(
                height: size.height * .04.h,
                child: TileWidget(
                  label:
                      "${StringsEn.featuring} ${cars.length} ${StringsEn.cars}",
                ),
              ),
              SearchListGridView(searchList: cars),
            ],
          );
  }
}
