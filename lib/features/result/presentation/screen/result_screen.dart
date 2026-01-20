import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/router/route_path.dart';

import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Initial Camera Position (Example: Pasadena/Altadena area from image)
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.147785, -118.144516), // Pasadena, CA
    zoom: 12.0,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showResultInfo();
    });
  }

  void _showResultInfo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(
        0.2,
      ), // Optional: lighter barrier for map visibility
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: const Color(0xFF101010), // Dark background matching image
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ---------- HANDLE / INDICATOR ----------
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            Gap(20.h),

            /// ---------- TITLE ----------
            Text(
              AppStrings.result.tr, // "Result"
              style: context.headlineSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(4.h),
            Text(
              "March - April 2025", // Hardcoded for now, or dynamic
              style: context.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            Gap(24.h),

            /// ---------- RESULT CARD ----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E), // Slightly lighter dark
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Icon Circle
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0D7B92), // Teal color
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.cloud_outlined,
                          color: Colors.white,
                          size: 24.sp,
                        ), // Replace with SVG if needed
                      ),
                      Gap(12.w),
                      // WET Text
                      Text(
                        AppStrings.wet.tr, // "WET"
                        style: context.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(12.h),
                  // Score
                  Text(
                    "${AppStrings.weightedScore.tr} (16 out of 18)",
                    style: context.bodyMedium.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Gap(24.h),

            /// ---------- BUTTON ----------
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton(
                onPressed: () {
                  context.pushNamed(RoutePath.resultSummaryScreen);
                },

                child: Text(
                  AppStrings.fullDetails.tr, // "Full Details"
                  style: context.titleMedium.copyWith(
                    color: AppColors.successColor,
                  ),
                ),
              ),
            ),
            Gap(24.h),

            /// ---------- FOOTER ----------
            Text(
              "${AppStrings.wetsStation.tr}: Altadena",
              style: context.bodySmall.copyWith(color: AppColors.secondaryText),
            ),
            Gap(4.h),
            Text(
              "${AppStrings.climateReferencePeriod.tr}: 1971-2000",
              style: context.bodySmall.copyWith(color: AppColors.secondaryText),
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showResultInfo();
        },
        child: const Icon(Icons.info),
      ),
      body: Stack(
        children: [
          /// ---------- GOOGLE MAP ----------
          GoogleMap(
            mapType: MapType.normal, // Or dark mode style json if available
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          /// ---------- BACK BUTTON ----------
          Positioned(
            top: 50.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 44.w,
                height: 44.w,
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
          ),
        ],
      ),
    );
  }
}
