import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SectionOtp extends StatefulWidget {
  const SectionOtp({super.key});

  @override
  State<SectionOtp> createState() => _SectionOtpState();
}

class _SectionOtpState extends State<SectionOtp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      //key: cont.formKey,
      child: Padding(
        padding: AppConsts.padding25h,
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: AppConsts.pastedTextStyle,
          textStyle: AppConsts.style24.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).canvasColor,
          ),
          length: 4,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 4) {
              return StringsEn.validator;
            } else {
              return null;
            }
          },
          enableActiveFill: true,
          errorTextSpace: 30,

          pinTheme: PinTheme(
            activeColor: AppConsts.mainColor,
            selectedColor: AppConsts.mainColor,
            inactiveColor: Theme.of(context).primaryColor,
            shape: PinCodeFieldShape.circle,
            activeFillColor: Theme.of(context).primaryColor.withOpacity(.5),
            inactiveFillColor: Theme.of(context).primaryColor.withOpacity(.5),
            selectedFillColor: Theme.of(context).primaryColor.withOpacity(.5),
            fieldHeight: 50,
            fieldWidth: 50,
          ),
          cursorColor: AppConsts.mainColor,
          animationDuration: const Duration(milliseconds: 300),
          //errorAnimationController: cont.errorController,
          //controller: cont.textEditingController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            debugPrint("Completed");
          },
          //onChanged: (value) => cont.onChanged(value),
          //onSubmitted: (value) => cont.onSubmtted(value),
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
