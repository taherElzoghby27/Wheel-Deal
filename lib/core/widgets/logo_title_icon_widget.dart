import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/chats/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'custom_photo.dart';

class LogoTitleIconWidget extends StatelessWidget {
  const LogoTitleIconWidget({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => GoRouter.of(context).push(chatPath),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///logo
          ClipRRect(
            borderRadius: AppConsts.mainRadiusImage,
            child: handleImage(
              image: chat.logo,
              height: size.height * .055.h,
            ),
          ),
          SizedBox(width: size.width * .02.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              FittedBox(
                child: SizedBox(
                  width: size.width * .45.w,
                  child: Text(
                    chat.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppConsts.style32.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              ///company.country
              SizedBox(
                width: size.width * .4.w,
                child: Text(
                  chat.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConsts.styleHint14.copyWith(
                    fontSize: 12,
                    color: AppConsts.neutral700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: size.width * .02.w),

          ///trailing
          SizedBox(
            width: size.width * .2.w,
            child: Center(
              child: Text(
                chat.time,
                style: AppConsts.style12.copyWith(
                  color: AppConsts.primary500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
