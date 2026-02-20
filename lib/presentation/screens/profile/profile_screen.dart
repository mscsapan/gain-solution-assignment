import 'package:flutter/material.dart';
import 'package:gain_solution_task/presentation/utils/k_images.dart';
import 'package:gain_solution_task/presentation/widgets/primary_button.dart';

import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widgets/circle_image.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roles = ['Manager','Admin','Admin & HR'];
    return  Scaffold(
      appBar: CustomAppBar(title: 'My Profile',isShowBackButton: false,isCenterText: false,),

      body: ListView(
        padding: Utils.only(bottom: Utils.mediaQuery(context).height * 0.05),
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
                        CustomText(text: 'Jonaus Kahnwald',fontWeight: FontWeight.w600,color: const Color(0xFF5C5D76),fontSize: 16.0,letterSpacing: 0.15,),
                        CustomText(text: 'Support',fontWeight: FontWeight.w500,color: textLight,fontSize: 14.0,letterSpacing: 0.15,),
                      ],
                    ),
                  ],
                ),

                CustomImage(path: KImages.editIcon),

              ],
            ),
          ),

          _headingText('Basic info',textRegular,Utils.symmetric(h: 16.0,v: 16.0)),
          Padding(
            padding: Utils.symmetric(h: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headingText('First name'),
                _titleText('Jonaus'),
                Utils.verticalSpace(8.0),
                _headingText('Last name'),
                _titleText('Ali'),
                Utils.verticalSpace(8.0),
                _headingText('Email'),
                _titleText('user@gmail.com'),
              ],
            ),
          ),
          _headingText('Assigned role (03)',textRegular,Utils.symmetric(h: 16.0,v: 16.0).copyWith(top: 32.0)),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(roles.length, (index){
                return Container(
                  padding: Utils.all(value: 16.0),
                  margin: Utils.only(right: 16.0,left: index == 0? 16.0:0.0),
                  decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: Utils.borderRadius(r: 8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: roles[index],fontWeight: FontWeight.w500,maxLine: 2,fontSize: 22.0,),
                      Container(
                        margin: Utils.symmetric(h: 0.0,v: 8.0),
                        height: 1.0,
                        width: 200.0,
                        color: cardBorderColor,
                      ),
                      _headingText('Group',textLight),
                      Utils.verticalSpace(4.0),
                      CustomText(text: 'Coddecanyon support' ?? '',fontWeight: FontWeight.w600,color: textRegular,),
                      Utils.verticalSpace(8.0),
                      _headingText('Manager',textLight),
                      Utils.verticalSpace(4.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 12.0,
                        children: [
                          CircleImage(size: 36.0,type: ImageType.border,borderColor: cardBorderColor,borderWidth: 2.0,),
                          CustomText(text: 'Jonaus Kahnwald',fontWeight: FontWeight.w600,color: textRegular,letterSpacing: 0.15,),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          PrimaryButton(text: 'Log Out',
            onPressed: () {},
            padding: Utils.symmetric(h: 16.0).copyWith(top: 24.0),
            buttonType: ButtonType.iconButton,
            bgColor: const Color(0xFFFFDADE),
            borderColor: transparent,
            textColor: redColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            borderRadiusSize: 50.0,
            icon: CustomImage(path: KImages.logoutIcon,color: redColor,),
          )

        ],
      ),
    );
  }
  Widget _headingText(String text,[Color? color,EdgeInsets ? padding]){
    return  Padding(
      padding: padding ?? Utils.all(),
      child: CustomText(text: text,fontWeight: FontWeight.w600,color: color?? textRegular,fontSize: 12.0,letterSpacing: 0.5,),
    );
  }
  Widget _titleText(String text){
    return CustomText(text: text,fontWeight: FontWeight.w600,color: blackColor,fontSize: 16.0,letterSpacing: 0.15,);
  }
}
