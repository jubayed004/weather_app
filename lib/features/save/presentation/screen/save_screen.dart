import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';

import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.save.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(12.h),
            _buildSavedItem(context, "Los Angeles, Altadena", "10:30 PM"),
            Gap(12.h),
            _buildSavedItem(
              context,
              "New York, Avalon Cataline AP",
              "10:30 PM",
            ),

            Gap(12.h),
            _buildSavedItem(context, "Los Angeles, Altadena", "10:30 PM"),
            Gap(12.h),
            _buildSavedItem(
              context,
              "New York, Avalon Cataline AP",
              "10:30 PM",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedItem(BuildContext context, String location, String time) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RoutePath.resultSummaryScreen);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                location,
                style: context.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              time,
              style: context.bodySmall.copyWith(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
