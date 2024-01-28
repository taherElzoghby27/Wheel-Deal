// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:donation/core/consts/route.dart';
// import 'package:donation/core/consts/style.dart';
// import 'package:donation/core/widgets/photo_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:photo_view/photo_view.dart';
//
// class ImageWidget extends StatelessWidget {
//   const ImageWidget({
//     Key? key,
//     required this.height,
//     required this.width,
//     required this.image,
//   }) : super(key: key);
//   final double height;
//   final double width;
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Get.toNamed(imageViewPath, arguments: image),
//       child: Container(
//         height: height,
//         width: width,
//         decoration: AppConsts.decorationImage,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15.sp),
//           child: CachedNetworkImage(
//             imageUrl: image,
//             imageBuilder: (context, imageProvider) => Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: imageProvider,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             placeholder: (context, url) => const Center(
//               child: CircularProgressIndicator(
//                 color: AppConsts.mainColor,
//               ),
//             ),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//           ),
//         ),
//       ),
//     );
//   }
// }
