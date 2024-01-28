// import 'package:donation/core/consts/strings.dart';
// import 'package:donation/core/consts/style.dart';
// import 'package:donation/core/services/service_locator.dart';
// import 'package:donation/core/widgets/customButton.dart';
// import 'package:donation/core/widgets/loading_dialog.dart';
// import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
// import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo_implementation.dart';
// import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class DialogOtp extends StatelessWidget {
//   const DialogOtp({
//     super.key,
//     required this.id,
//     required this.name,
//     required this.phone,
//   });
//
//   final String id;
//   final String name;
//   final String phone;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GetX(
//       init: Get.put(
//         ConnectUsController(
//           authConnectUsRepo: getIt.get<AuthConnectUsRepoImplementation>(),
//           authRepo: getIt.get<AuthRepoImplementation>(),
//         ),
//       ),
//       builder: (cont) {
//         return cont.isLoadingDialogOtp.value
//             ? const LoadingDialog()
//             : AlertDialog(
//                 content: SizedBox(
//                   height: size.height * .19.h,
//                   width: size.width,
//                   child: Column(
//                     children: [
//                       ///otp
//                       const Text(StringsEn.otp, style: AppConsts.style16),
//                       SizedBox(height: size.height * .01.h),
//
//                       ///otp code
//                       Form(
//                         key: cont.formKey,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             vertical: 4.h,
//                             horizontal: 8.w,
//                           ),
//                           child: PinCodeTextField(
//                             appContext: context,
//                             pastedTextStyle: AppConsts.pastedTextStyle,
//                             length: 6,
//                             animationType: AnimationType.fade,
//                             validator: (v) {
//                               if (v!.length < 6) {
//                                 return StringsEn.validator.tr;
//                               } else {
//                                 return null;
//                               }
//                             },
//                             pinTheme: PinTheme(
//                               activeColor: AppConsts.mainColor,
//                               selectedColor: AppConsts.mainColor,
//                               inactiveColor:
//                                   AppConsts.mainColor.withOpacity(.5),
//                               shape: PinCodeFieldShape.box,
//                               borderRadius: BorderRadius.circular(5),
//                               fieldHeight: size.height * .055.h,
//                               fieldWidth: size.width * .1.w,
//                               activeFillColor: AppConsts.sWhite,
//                             ),
//                             cursorColor: AppConsts.mainColor,
//                             animationDuration:
//                                 const Duration(milliseconds: 300),
//                             errorAnimationController: cont.errorController,
//                             //controller: cont.textEditingController,
//                             keyboardType: TextInputType.number,
//                             onCompleted: (v) {
//                               debugPrint("Completed");
//                             },
//                             onChanged: (value) => cont.onChangedOtp(value),
//                             onSubmitted: (value) => cont.onSubmttedOtp(value),
//                             beforeTextPaste: (text) {
//                               debugPrint("Allowing to paste $text");
//                               //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                               //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                               return true;
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: size.height * .002.h),
//
//                       ///verify button
//                       SizedBox(
//                         width: size.width*.4.w,
//                         height: size.height*.05.h,
//                         child: CustomButton(
//                           text: StringsEn.verify.tr,
//                           onTap:  () => cont.verifyDeleteAccount(
//                             verId: id,
//                             name: name,
//                             phone: phone,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: size.height * .01.h),
//                     ],
//                   ),
//                 ),
//               );
//       },
//     );
//   }
// }
