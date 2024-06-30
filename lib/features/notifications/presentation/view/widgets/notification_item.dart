import 'package:cars/core/theming/style.dart';
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
              const Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 50,
                  foregroundImage: NetworkImage(
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
                        style: AppConsts.style12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '4 April 2024',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppConsts.style12.copyWith(
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).canvasColor.withOpacity(.4),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '09:30 PM',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppConsts.style12.copyWith(
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).canvasColor.withOpacity(.4),
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
                  radius: 6,
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
