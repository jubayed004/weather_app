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
    /*   controller.getPrivacyPolicy();*/
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
        switch (controller.privacyLoading.value) {
          case ApiStatus.loading:
            return const LoadingWidget();
          case ApiStatus.internetError:
          /*  return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/
          case ApiStatus.noDataFound:
            return Center(child: Text("No data found!".tr));
          case ApiStatus.error:
          /*            return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/

          case ApiStatus.completed:
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    "1. Scope of Service",
                    "MYTRAINERR provides an online platform that connects individuals seeking fitness training ('Clients') with personal trainers ('Trainers').\nThe services include facilitating the booking, payment, and management of training sessions.",
                  ),
                  _buildSection(
                    "2. User Accounts & Responsibilities",
                    "To access our services, you must register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete. You are responsible for safeguarding your password and for any activities or actions under your account.",
                  ),
                  _buildSection(
                    "3. Booking and Payment",
                    "Clients can book sessions with Trainers through the app. All payments are processed through our third-party payment provider. Cancellation and refund policies are determined by each trainer and will be clearly stated at the time of booking.\nMYTRAINERR is not responsible for any disputes between Clients and Trainers regarding payments or services.",
                  ),
                  _buildSection(
                    "4. Liability & Disclaimers",
                    "MYTRAINERR is a platform provider and is not liable for the quality of training, advice, or any injuries that may occur during a session. Users engage with trainers at their own risk. We do not conduct background checks on all Trainers and encourage Clients to perform their own due diligence.",
                  ),
                  _buildSection(
                    "5. Termination",
                    "We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the Service will immediately cease.",
                  ),
                  _buildSection(
                    "6. Contact Information",
                    "For any questions about these Terms, please contact us at legal@mytrainerr.app.",
                  ),
                ],
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
