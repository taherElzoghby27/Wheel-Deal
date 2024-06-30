import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldsSection extends StatelessWidget {
  const FieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          CustomTextFormField(
            hint: StringsEn.firstName,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          CustomTextFormField(
            hint: StringsEn.lastName,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          CustomTextFormField(
            hint: StringsEn.phoneNumber,
            perfixIcon: CountryCodePicker(
              initialSelection: StringsEn.eg,
              flagWidth: 25,
              onChanged: (CountryCode code) {},
              showDropDownButton: true,
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              showFlagDialog: true,
              hideMainText: true,
              showFlagMain: true,
            ),
          ),
        ],
      ),
    );
  }
}
