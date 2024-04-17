import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: AppConsts.aspectRatio16on3,
        child: Padding(
          padding: AppConsts.padding8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///logo
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: AppConsts.mainRadius,
                  child: HandleImageWidget(
                    image:
                        'https://engineering.unl.edu/images/staff/Kayla-Person.jpg',
                  ),
                ),
              ),

              Expanded(
                flex: 8,
                child: Padding(
                  padding: AppConsts.padding8h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///title
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppConsts.style20.copyWith(
                          fontSize: 18,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '4 April 2024',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppConsts.styleHint14.copyWith(
                              color: AppConsts.neutral500,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '09:30 PM',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppConsts.styleHint14.copyWith(
                              color: AppConsts.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              ///trailing
              const Expanded(
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppConsts.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
