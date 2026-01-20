import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/features/profile/presentation/screen/widgets/profile_menu_item.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.accountSettings.tr),

        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Gap(20.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkSurface,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: ProfileMenuItem(
                icon: Icons.lock_reset_outlined,
                title: AppStrings.changePassword.tr,
                onTap: () {
                  context.pushNamed(RoutePath.changePasswordScreen);
                },
                showDivider: false,
                iconColor: AppColors.successColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
