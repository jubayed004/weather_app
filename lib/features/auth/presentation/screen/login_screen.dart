import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/helper/validator/text_field_validator.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(
    text: kDebugMode ? 'john.doe@example.com' : '',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: kDebugMode ? 'Password00' : '',
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.agroClima.tr,
                    textAlign: TextAlign.center,
                    style: context.headlineLarge.copyWith(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(60),
                  Text(AppStrings.signIn.tr, style: context.headlineLarge),
                  const Gap(8),
                  Text(
                    AppStrings.getStarted.tr,
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(40),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.enterEmailAddress.tr,
                    validator: TextFieldValidator.email(),
                  ),
                  const Gap(16),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: AppStrings.enterPassword.tr,
                    isPassword: true,
                    validator: TextFieldValidator.password(),
                  ),
                  const Gap(32),
                  CustomButton(
                    isLoading: false,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // Implement Login Logic
                        // For now, assume success and go to Home
                        context.goNamed(RoutePath.homeScreen);
                      }
                    },
                    text: AppStrings.signIn.tr,
                  ),
                  const Gap(8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.pushNamed(RoutePath.forgetPasswordScreen);
                      },
                      child: Text(
                        AppStrings.forgotPassword.tr,
                        style: context.labelMedium.copyWith(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Gap(60),
                  Text(
                    AppStrings.dontHaveAnAccount.tr,
                    style: context.labelMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(16),
                  OutlinedButton(
                    onPressed: () {
                      context.pushNamed(RoutePath.signUpScreen);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primaryText),
                      foregroundColor: AppColors.primaryText,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(AppStrings.createNewAccount.tr),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
