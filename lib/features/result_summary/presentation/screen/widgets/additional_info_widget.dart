import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';

class AdditionalInfoWidget extends StatelessWidget {
  const AdditionalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final info = Get.find<HomeController>()
        .resultSummaryModel
        .value
        .data
        ?.additionalInfo;

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
                text: "WETS Station: ${info?.wetsStation ?? 'N/A'}",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                text: "Location: ${info?.location ?? 'N/A'}",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.layers_outlined,
                text: "Soil Map Unit: ${info?.soilMapUnit ?? 'N/A'}",
              ),
              Gap(12.h),
              _buildInfoRow(
                context,
                icon: Icons.eco_outlined,
                text:
                    "Growing Season (${info?.growingSeasonThreshold ?? '50% > 28°F'})\n${info?.growingSeason ?? 'N/A'}",
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
