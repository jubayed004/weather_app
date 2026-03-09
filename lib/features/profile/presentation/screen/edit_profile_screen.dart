import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/profile/controller/profile_controller.dart';
import 'package:weather_app/helper/validator/text_field_validator.dart';
import 'package:weather_app/share/widgets/button/custom_button.dart';
import 'package:weather_app/share/widgets/network_image/custom_network_image.dart';
import 'package:weather_app/share/widgets/text_field/custom_text_field.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/extension/base_extension.dart';
import 'package:weather_app/utils/config/app_config.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: _profileController.profile.value.data?.name ?? "",
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.editProfile.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30.h),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(() {
                    if (_profileController.selectedImage.value != null) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.file(
                          File(_profileController.selectedImage.value!.path),
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return CustomNetworkImage(
                      imageUrl:
                          _profileController.profile.value.data?.avatar ??
                          AppConfig.defaultProfile,
                      height: 100.h,
                      width: 100.w,
                      borderRadius: BorderRadius.circular(50.r),
                    );
                  }),
                  // Overlay for edit icon
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        _profileController.pickImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(40.h),
            Text(
              AppStrings.name.tr,
              style: context.titleMedium.copyWith(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(8.h),
            CustomTextField(
              controller: _nameController,
              hintText: AppStrings.enterYourName.tr,
              validator: TextFieldValidator.name(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: Obx(() {
          return CustomButton(
            text: AppStrings.updateProfile.tr,
            isLoading: _profileController.updateProfileLoading.value,
            onTap: () {
              // Update logic
              _profileController.updateProfile(
                body: {"name": _nameController.text},
              );
            },
          );
        }),
      ),
    );
  }
}
