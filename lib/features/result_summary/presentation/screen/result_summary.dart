import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/features/result_summary/presentation/screen/widgets/additional_info_widget.dart';
import 'package:weather_app/features/result_summary/presentation/screen/widgets/rainfall_record_widget.dart';
import 'package:weather_app/features/result_summary/presentation/screen/widgets/result_summary_card.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class ResultSummaryScreen extends StatelessWidget {
  const ResultSummaryScreen({super.key});

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
          AppStrings.resultSummary.tr,
          style: context.headlineMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            const ResultSummaryCard(),
            Gap(24.h),
            const RainfallRecordWidget(),
            Gap(24.h),
            const AdditionalInfoWidget(),
            Gap(32.h),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton(
                onPressed: () {
                  context.pushNamed(RoutePath.saveScreen);
                },
                child: Text(AppStrings.save.tr),
              ),
            ),
            Gap(32.h),

            // Footer
            Text(
              "Climate Reference Period: 1971-2000",
              style: context.bodySmall.copyWith(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
