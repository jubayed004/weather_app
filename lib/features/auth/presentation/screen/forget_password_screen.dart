import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/auth/controller/auth_controller.dart';
import 'package:weather_app/helper/validator/text_field_validator.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: BackButton(color: AppColors.white),
        title: Text(
          AppStrings.agroClima.tr,
          style: context.headlineSmall.copyWith(color: AppColors.primaryText),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------- TITLE ----------
                Text(
                  AppStrings.forgotPasswordTitle.tr, // Use title from strings
                  style: context.headlineMedium.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(12.h),

                /// ---------- SUBTITLE ----------
                Text(
                  AppStrings.sendVerificationCodeMessage.tr,
                  style: context.bodyMedium.copyWith(
                    color: isDarkMode ? Colors.white : AppColors.secondaryText,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(40.h),

                /// ---------- EMAIL INPUT ----------
                CustomTextField(
                  controller: _emailController,
                  hintText: AppStrings.enterEmailAddress.tr,
                  validator: TextFieldValidator.email(),
                ),
                Gap(24.h),

                /// ---------- SUBMIT BUTTON ----------
                Obx(
                  () => CustomButton(
                    text: AppStrings.sendConfirmation.tr,
                    isLoading: _authController.forgotPasswordLoading.value,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.forgotPassword(
                          email: _emailController.text,
                        );
                      }

                      //AppRouter.route.pushNamed(RoutePath.forgetOtpScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
