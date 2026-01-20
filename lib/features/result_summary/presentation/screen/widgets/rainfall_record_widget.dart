import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class RainfallRecordWidget extends StatelessWidget {
  const RainfallRecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.rainfallRecord.tr,
          style: context.titleMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(12.h),
        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeaderCell(context, AppStrings.month.tr, flex: 2),
              _buildHeaderCell(context, "30% <", flex: 1),
              _buildHeaderCell(context, AppStrings.avg.tr, flex: 1),
              _buildHeaderCell(context, "30% >", flex: 1),
              _buildHeaderCell(
                context,
                AppStrings.rainfall.tr,
                flex: 1,
                isEnd: true,
              ),
            ],
          ),
        ),
        Gap(8.h),
        // Rows
        _buildRow(
          context,
          month: "March",
          less30: "2.04",
          avg: "4.48",
          more30: "5.26",
          rainfall: "5",
          statusColor: AppColors.wefColor, // Wet
        ),
        Gap(12.h),
        _buildRow(
          context,
          month: "April",
          less30: "0.39",
          avg: "4.21",
          more30: "5.22",
          rainfall: "5",
          statusColor: AppColors.wefColor, // Wet
        ),
        Gap(12.h),
        _buildRow(
          context,
          month: "May",
          less30: "0.10",
          avg: "4.17",
          more30: "4.73",
          rainfall: "4",
          statusColor:
              AppColors.wefColor, // Wet - using same color as image implies
        ),
        Gap(16.h),
        // Legend
        Row(
          children: [
            _buildLegendItem(
              context,
              color: AppColors.dryColor,
              text: AppStrings.dry.tr,
            ),
            Gap(16.w),
            _buildLegendItem(
              context,
              color: AppColors.normalColor,
              text: AppStrings.normal.tr,
            ),
            Gap(16.w),
            _buildLegendItem(
              context,
              color: AppColors.wefColor,
              text: AppStrings.wet.tr,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderCell(
    BuildContext context,
    String text, {
    int flex = 1,
    bool isEnd = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: isEnd ? TextAlign.center : TextAlign.start,
        style: context.bodyMedium.copyWith(
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String month,
    required String less30,
    required String avg,
    required String more30,
    required String rainfall,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.darkSurface, // Dark card background
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              month,
              style: context.bodyMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              less30,
              style: context.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              avg,
              style: context.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              more30,
              style: context.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  rainfall,
                  style: context.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(
    BuildContext context, {
    required Color color,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Gap(6.w),
        Text(
          text,
          style: context.bodySmall.copyWith(
            color: AppColors.secondaryText,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
