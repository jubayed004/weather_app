import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1C1C1E), // Dark surface
            Color(0xFF18301E), // Dark Green tint
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF2C2C2E)),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image Placeholder
              CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.darkSurface,
                backgroundImage: const NetworkImage(
                  "https://i.pravatar.cc/300",
                ), // Placeholder or Asset
              ),
              Gap(16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(8.h),
                  Text(
                    "Iris Rodriguez",
                    style: context.titleLarge.copyWith(color: Colors.white),
                  ),
                  Gap(4.h),
                  Text(
                    "irisrodriguez@mail.com",
                    style: context.bodyMedium.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: OutlinedButton(
              onPressed: () {
                AppRouter.route.pushNamed(RoutePath.editProfileScreen);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Color(
                  0xFF151515,
                ), // Darker background for button
                side: BorderSide.none,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                minimumSize: Size(0, 36.h),
              ),
              child: Text(
                "Edit Profile",
                style: context.bodyMedium.copyWith(
                  color: AppColors.successColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
