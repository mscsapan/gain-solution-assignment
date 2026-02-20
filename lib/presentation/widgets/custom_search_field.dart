import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import '../utils/k_images.dart';
import '../utils/utils.dart';
import 'custom_image.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.hintText, required this.onChanged});
  final String hintText;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      // onChanged: (val) => filterCubit.searchTag(val),
      decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          fillColor: grayBackgroundColor,
          // prefixIcon: Icon(Icons.search_outlined, color: blackColor,)
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.horizontalSpace(12.0),
              CustomImage(path: KImages.searchIcon,color: blackColor,),
            ],
          )
      ),
    );
  }
}
