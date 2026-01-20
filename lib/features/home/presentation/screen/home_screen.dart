import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/helper/date_converter/date_converter.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/dropdown/custom_dropdown_field.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock Data
  final List<String> states = ['California', 'Texas', 'Florida', 'New York'];
  final List<String> counties = ['County A', 'County B', 'County C'];

  final ValueNotifier<String?> selectedState = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedCounty = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedDate = ValueNotifier<String?>(null);
  final TextEditingController _fipsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _fipsController.dispose();
    selectedState.dispose();
    selectedCounty.dispose();
    selectedDate.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.successColor,
              onPrimary: Colors.white,
              surface: AppColors.darkSurface,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: AppColors.darkSurface,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateConverter.formatDate(
          dateTime: picked,
          format: 'yyyy-MM-dd',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Gap(20.h),

              /// ---------- HEADER ----------
              Center(
                child: Text(
                  AppStrings.agroClima.tr,
                  style: context.headlineMedium.copyWith(
                    color: AppColors.successColor, // Green color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(40.h),

              /// ---------- FORM CONTAINER ----------
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E), // Dark surface
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    /// ---------- STATE DROPDOWN ----------
                    ValueListenableBuilder<String?>(
                      valueListenable: selectedState,
                      builder: (context, value, child) {
                        return CustomDropdownField<String>(
                          hintText: AppStrings.selectState.tr,
                          items: states,
                          value: value,
                          onChanged: (newValue) {
                            selectedState.value = newValue;
                          },
                          fillColor: AppColors.darkBackground,
                          labelBuilder: (item) => item,
                        );
                      },
                    ),
                    Gap(16.h),

                    /// ---------- COUNTY DROPDOWN ----------
                    ValueListenableBuilder<String?>(
                      valueListenable: selectedCounty,
                      builder: (context, value, child) {
                        return CustomDropdownField<String>(
                          hintText: AppStrings.selectCounty.tr,
                          items: counties,
                          value: value,
                          onChanged: (newValue) {
                            selectedCounty.value = newValue;
                          },
                          fillColor: AppColors.darkBackground,
                          labelBuilder: (item) => item,
                        );
                      },
                    ),
                    Gap(16.h),
                    // ValueListenableBuilder<String?>(
                    //   valueListenable: selectedDate,
                    //   builder: (context, value, child) {
                    //     return CustomDropdownField<String>(
                    //       hintText: "Observation Date",
                    //       items: observationDates,
                    //       value: value,
                    //       onChanged: (newValue) {
                    //         selectedDate.value = newValue;
                    //       },
                    //       fillColor: AppColors.darkBackground,
                    //       labelBuilder: (item) => item,
                    //     );
                    //   },
                    // ),
                    CustomTextField(
                      controller: _dateController,
                      hintText: "Observation Date",
                      fillColor: AppColors.darkBackground,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    Gap(16.h),

                    /// ---------- DATE & FIPS ----------
                    // Row(
                    //   children: [
                    //     // Observation Date
                    //     // Expanded(
                    //     //   flex: 3,
                    //     //   child:
                    //     // ),
                    //     Gap(12.w),
                    //     // FIPS ID
                    //     Expanded(
                    //       child: Container(
                    //         height: 54.h,
                    //         padding: const EdgeInsets.symmetric(horizontal: 12),
                    //         decoration: BoxDecoration(
                    //           color: AppColors.darkBackground,
                    //           borderRadius: BorderRadius.circular(15),
                    //           border: Border.all(
                    //             color: AppColors.brandHoverColor,
                    //             width: 1.2,
                    //           ),
                    //         ),
                    //         child: TextField(
                    //           controller: _fipsController,
                    //           style: const TextStyle(color: Colors.white),
                    //           decoration: InputDecoration(
                    //             hintText: AppStrings.fipsId.tr,
                    //             hintStyle: const TextStyle(
                    //               color: AppColors.brandHoverColor,
                    //               fontSize: 14,
                    //             ),
                    //             border: InputBorder.none,
                    //             contentPadding: EdgeInsets.only(bottom: 8.h),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CustomTextField(
                      controller: _fipsController,
                      hintText: AppStrings.fipsId.tr,

                      fillColor: AppColors.darkBackground,
                    ),
                    Gap(24.h),

                    /// ---------- SEARCH BUTTON ----------
                    CustomButton(
                      text: AppStrings.search.tr,
                      isLoading: false,
                      onTap: () {
                        // Implement Search Logic
                      },
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// ---------- CLIMATE REF PERIOD ----------
              Text(
                "${AppStrings.climateReferencePeriod.tr}: 1971-2000",
                style: context.bodySmall.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              Gap(20.h),
            ],
          ),
        ),
      ),

      /// ---------- QUICK SEARCH FAB ----------
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xFF1C1C1E), // Dark surface
            shape: const CircleBorder(
              side: BorderSide(color: Color(0xFF2C2C2E)),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: AppColors.successColor,
            ),
          ),
          Gap(4.h),
          Text(
            AppStrings.quickSearch.tr,
            style: context.bodySmall.copyWith(
              color: AppColors.successColor,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
