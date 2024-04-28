import 'package:facebook_ui/facebook_ui/widgets/quick_button.dart';
import 'package:facebook_ui/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            QuickButton(
              color: Color(0xff92BE87),
              iconData: CustomIcons.photos,
              label: "Gallery",
            ),
            SizedBox(
              width: 15,
            ),
            QuickButton(
              color: Color(0xff2880D4),
              iconData: CustomIcons.user_friends,
              label: "Tag Friends",
            ),
            SizedBox(
              width: 15,
            ),
            QuickButton(
              color: Color(0xffFB7171),
              iconData: CustomIcons.video_camera,
              label: "Live",
            ),
          ],
        ),
      ),
    );
  }
}
