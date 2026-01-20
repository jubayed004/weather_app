import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';

import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
            decoration: const BoxDecoration(
              color: Color(0xFF1C1C1E), // Dark circle
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Saved", // Should be in AppStrings but hardcoding for speed/accuracy per design
          style: context.headlineMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
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
    return Container(
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
    );
  }
}
