import 'package:flutter/material.dart';
import 'package:gain_solution_task/presentation/utils/k_images.dart';

import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widgets/circle_image.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.isFromBottom});
  final bool? isFromBottom;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'My Profile',isShowBackButton: isFromBottom ?? false,isCenterText: false,),

      body: ListView(
        children: [
          Container(
            padding: Utils.all(value: 16.0),
            // margin: Utils.symmetric(h: 0.0,v: 0.0).copyWith(bottom: 12.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE6F6FC),
                borderRadius: Utils.borderRadius(r: 8.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12.0,
                  children: [
                    CircleImage(size: 60.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Mohammad Ali',fontWeight: FontWeight.w600,color: const Color(0xFF5C5D76),fontSize: 16.0,letterSpacing: 0.15,),
                        CustomText(text: 'Developer',fontWeight: FontWeight.w500,color: textLight,fontSize: 14.0,letterSpacing: 0.15,),
                      ],
                    ),
                  ],
                ),

                CustomImage(path: KImages.editIcon),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
