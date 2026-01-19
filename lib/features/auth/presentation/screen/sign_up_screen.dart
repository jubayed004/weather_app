import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/helper/validator/text_field_validator.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(
    text: kDebugMode ? 'John Doe' : '',
  );
  final TextEditingController _emailController = TextEditingController(
    text: kDebugMode ? 'john.doe@example.com' : '',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: kDebugMode ? 'Password00' : '',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.darkBackground,
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
                      color: AppColors.primaryText, // Keep brand color override
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(60),
                  Text(AppStrings.signUp.tr, style: context.headlineLarge),
                  const Gap(8),
                  Text(
                    AppStrings.getStarted.tr,
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.white, // Explicitly white as per design
                    ),
                  ),
                  const Gap(40),
                  CustomTextField(
                    controller: _nameController,
                    hintText: AppStrings.enterYourName.tr,
                    validator: TextFieldValidator.name(),
                  ),
                  const Gap(16),
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
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // TODO: Implement Sign Up Logic
                      // }

                      AppRouter.route.goNamed(RoutePath.activeOtpScreen);
                    },
                    text: AppStrings.signUp.tr,
                  ),
                  const Gap(24),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "${AppStrings.alreadyHaveAnAccount.tr} ",
                        style: context.labelMedium.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.signIn.tr,
                            style: context.labelMedium.copyWith(
                              color: AppColors.darkPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop(); // Go back to Sign In
                              },
                          ),
                        ],
                      ),
                    ),
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
