import 'package:flutter/material.dart';

import '../../../utils/k_images.dart';
import '../../../widgets/circle_image.dart';
import '/presentation/utils/constraints.dart';
import '/presentation/utils/utils.dart';
import '../../../../data/models/contact/contact_item_model.dart';
import '../../../widgets/custom_text.dart';

class ContactComponent extends StatelessWidget {
  const ContactComponent({super.key, this.contactItem,required this.index});
  final ContactItemModel ? contactItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    final image = 'https://randomuser.me/api/portraits/${contactItem?.gender == 'Male'? 'male':'women'}/$index.jpg';
    return Container(
      padding: Utils.all(value: 12.0),
      margin: Utils.symmetric(h: 0.0,v: 0.0).copyWith(bottom: 12.0),
      decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: Utils.borderRadius(r: 8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12.0,
                children: [
                  // CircleImage(size: 40.0,type: ImageType.border,borderColor: cardBorderColor,image: contactItem?.image??KImages.defaultImg,borderWidth: 2.0,),
                  CircleImage(size: 40.0,type: ImageType.border,borderColor: cardBorderColor,image: image,borderWidth: 2.0,),
                  CustomText(text: '${contactItem?.firstName} ${contactItem?.lastName}',fontWeight: FontWeight.w600,color: blackColor,fontSize: 16.0,letterSpacing: 0.15,),
                ],
              ),

              PopupMenuButton<String>(
                onSelected: (value) {
                  debugPrint('Selected: $value');
                },
                color: whiteColor,
                // menuPadding: Utils.symmetric(h: 10.0),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: CustomText(text: 'Edit',fontWeight: FontWeight.w600,letterSpacing: 0.01,color: blackColor),
                  ),
                  const PopupMenuItem(
                    value: 'view',
                    child: CustomText(text: 'View Tickets',fontWeight: FontWeight.w600,letterSpacing: 0.01,color: blackColor),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: CustomText(text: 'Delete',fontWeight: FontWeight.w600,letterSpacing: 0.01,color: blackColor),
                  ),
                ],
              ),

            ],
          ),
          Utils.verticalSpace(12.0),
          _basicInfo(Icons.email_outlined,contactItem?.email),
          _basicInfo(Icons.call_outlined,contactItem?.phone),
          _basicInfo(Icons.location_on_outlined,contactItem?.address),
          // CustomText(text: '${contactItem?.email}',fontWeight: FontWeight.w500,color: textRegular,letterSpacing: 0.25,),
          // CustomText(text: '${contactItem?.phone}',fontWeight: FontWeight.w500,color: textRegular,letterSpacing: 0.25,),
          // CustomText(text: '${contactItem?.address}',fontWeight: FontWeight.w500,color: textRegular,letterSpacing: 0.25,),
        ],
      ),
    );
  }
  Widget _basicInfo(IconData icon,String?value){
    return Padding(
      padding: Utils.only(bottom: 4.0),
      child: Row(
        spacing: 4.0,
        children: [
          Icon(icon,color: blackColor,size: 20.0,),
          CustomText(text: value??'',fontWeight: FontWeight.w500,color: textRegular,letterSpacing: 0.25,),
        ],
      ),
    );
  }
}
