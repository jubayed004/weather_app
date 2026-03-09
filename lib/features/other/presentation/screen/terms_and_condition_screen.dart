import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/other/controller/other_controller.dart';
import 'package:weather_app/share/widgets/loading/loading_widget.dart';
import 'package:weather_app/utils/app_strings/app_strings.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/enum/app_enum.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  final controller = Get.find<OtherController>();

  @override
  void initState() {
    controller.getTermsCondition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.termsCondition.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (controller.termsLoading.value) {
          case ApiStatus.loading:
            return const LoadingWidget();
          case ApiStatus.internetError:
          case ApiStatus.noDataFound:
            return Center(child: Text("No data found!".tr));
          case ApiStatus.error:
            return Center(child: Text("Something went wrong!".tr));

          case ApiStatus.completed:
            final sections =
                controller.termsConditionsData.value.data?.sections ?? [];
            if (sections.isEmpty) {
              return Center(child: Text("No data found!".tr));
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  sections.length,
                  (index) => _buildSection(
                    sections[index].heading ?? "Section ${index + 1}",
                    sections[index].content ?? "",
                  ),
                ),
              ),
            );
        }
      }),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryText,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.secondaryText,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
