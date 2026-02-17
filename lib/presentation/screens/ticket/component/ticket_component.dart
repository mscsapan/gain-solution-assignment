import 'package:flutter/material.dart';

import '../../../../data/models/ticket/ticket_item_model.dart';
import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';

class TicketComponent extends StatelessWidget {
  const TicketComponent({super.key, this.ticketItem, required this.index});
  final TicketItemModel ? ticketItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.all(value: 12.0),
      margin: Utils.symmetric(h: 0.0,v: 6.0),
      decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: Utils.borderRadius(r: 8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(label: CustomText(text: 'New',color: blueColor,fontWeight: FontWeight.w600,fontSize: 12.0,letterSpacing:0.5),backgroundColor: blueColor.withValues(alpha: 0.2),side: BorderSide(color: transparent),shape: RoundedRectangleBorder(borderRadius: Utils.borderRadius(r: 8.0)),),
          Utils.verticalSpace(12.0),
          CustomText(text: '#ID ${ticketItem?.id}',fontWeight: FontWeight.w500,color: textLight,letterSpacing:0.5),
          Utils.verticalSpace(8.0),
          CustomText(text: ticketItem?.description ?? '',fontWeight: FontWeight.w600,letterSpacing: 0.1,maxLine: 2,),
          Utils.verticalSpace(8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: '${ticketItem?.customer}',fontWeight: FontWeight.w500,color: textRegular,fontSize: 12.0,),
              Padding(
                padding: Utils.symmetric(h: 4.0),
                child: CustomText(text: '\u2022',fontWeight: FontWeight.w500,color: textRegular),
              ),
              CustomText(text: Utils.timeWithData(ticketItem?.createdAt),fontWeight: FontWeight.w500,color: textRegular,fontSize: 12.0),
            ],
          ),
          Container(
            margin: Utils.symmetric(h: 0.0,v: 12.0),
            height: 1.0,
            color: cardBorderColor,
          ),
          // Divider(color: cardBorderColor,indent: 0.0,endIndent: 0.0,thickness: 0.0,height: 4.0,),
          Row(
            children: List.generate(ticketItem?.tags?.length??0, (index){
              final tag = ticketItem?.tags?[index];
              return Container(
                padding: Utils.symmetric(h: 12.0,v: 6.0),
                margin: Utils.only(right: 12.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: Utils.borderRadius(r: 8.0),
                  border: Border.all(color: cardBorderColor),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: Utils.all(value: 3.0),
                      margin: Utils.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: ticketItem?.tags?.isNotEmpty??false? index == 0? Utils.ticketColor(ticketItem?.status):transparent:transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    CustomText(text: Utils.capitalizeFirstLetter(tag??''),color: textRegular,fontSize: 12.0,fontWeight: FontWeight.w500,),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
