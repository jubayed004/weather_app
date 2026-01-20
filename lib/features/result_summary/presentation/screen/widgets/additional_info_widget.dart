import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class AdditionalInfoWidget extends StatelessWidget {
  const AdditionalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.additionalInformation.tr,
          style: context.titleMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              _buildInfoRow(
                context,
                icon: Icons.cell_tower,
                text: "WETS Station: Altadena",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                text: "Location: Los Angeles, Altadena",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.layers_outlined,
                text:
                    "Soil Map Unit: Kullit-Addielou complex, 1 to 3 percent slope",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.eco_outlined,
                text:
                    "Growing Season (50% > 28°F)\nMarch 4 - November 26 267 days",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.successColor, size: 20.sp),
        Gap(12.w),
        Expanded(
          child: Text(
            text,
            style: context.bodyMedium.copyWith(
              color: AppColors.secondaryText,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
