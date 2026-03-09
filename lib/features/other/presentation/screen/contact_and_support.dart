import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/helper/validator/text_field_validator.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/features/other/controller/other_controller.dart';
import 'package:get/get.dart';

class ContactAndSupportScreen extends StatefulWidget {
  const ContactAndSupportScreen({super.key});

  @override
  State<ContactAndSupportScreen> createState() =>
      _ContactAndSupportScreenState();
}

class _ContactAndSupportScreenState extends State<ContactAndSupportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _otherController = Get.find<OtherController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.contactSupport.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gap(30.h),
              CustomTextField(
                controller: _nameController,
                hintText: AppStrings.enterYourName.tr,
                validator: TextFieldValidator.name(),
              ),
              Gap(16.h),
              CustomTextField(
                controller: _emailController,
                hintText: AppStrings.enterEmailAddress.tr,
                validator: TextFieldValidator.email(),
              ),
              Gap(16.h),
              CustomTextField(
                controller: _messageController,
                hintText: AppStrings.writeHere.tr,
                maxLines: 5,
                validator: TextFieldValidator.description(),
              ),
              Gap(30.h),
              Obx(
                () => CustomButton(
                  text: "Submit".tr,
                  isLoading: _otherController.faqLoading.value,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _otherController.contact(
                        body: {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "message": _messageController.text,
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
