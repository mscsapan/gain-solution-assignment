import 'package:flutter/material.dart';

import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MainController();

    return Container(
      padding: Utils.symmetric(h: 16.0, v: 10.0),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: StreamBuilder<int>(
        initialData: 0,
        stream: controller.naveListener.stream,
        builder: (context, snapshot) {
          final index = snapshot.data ?? 0;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                label: "Tickets",
                icon: Icons.confirmation_num_outlined,
                selectedIcon: Icons.confirmation_num,
                isSelected: index == 0,
                onTap: () => controller.naveListener.sink.add(0),
              ),
              _NavItem(
                label: "Contacts",
                icon: Icons.group_outlined,
                selectedIcon: Icons.group,
                isSelected: index == 1,
                onTap: () => controller.naveListener.sink.add(1),
              ),
              _NavItem(
                label: "Profile",
                icon: Icons.person_outline,
                selectedIcon: Icons.person,
                isSelected: index == 2,
                onTap: () => controller.naveListener.sink.add(2),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: Utils.borderRadius(r: 30.0),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: Utils.symmetric(h: 24.0, v: 8.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? Color(0xFFE6F6FC)
                    : transparent,
                borderRadius: Utils.borderRadius(r: 30.0),
              ),
              child: Icon(
                isSelected ? selectedIcon : icon,
                color: isSelected ? primaryColor : blackColor,
                size: 26.0,
              ),
            ),
            Utils.verticalSpace(4.0),
            CustomText(text:
              label,
                fontSize: 11.0,
                fontWeight: isSelected? FontWeight.w600:FontWeight.w500,
                color: blackColor,

            ),
          ],
        ),
      ),
    );
  }
}