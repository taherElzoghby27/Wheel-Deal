// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../consts/style.dart';

// class TileText extends StatelessWidget {
//   const TileText({
//     super.key,
//     required this.first,
//     required this.second,
//     this.siz = .85,
//   });

//   final String first;
//   final String second;
//   final double siz;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SizedBox(
//       width: size.width * siz.w,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '$first : ',
//             style: AppConsts.style14,
//           ),
//           Expanded(
//             child: Text(
//               second,
//               style: AppConsts.style14.copyWith(
//                 color: AppConsts.black,
//               ),
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               maxLines: 1,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
