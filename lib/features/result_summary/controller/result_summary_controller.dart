import 'package:get/get.dart';
import 'package:weather_app/core/di/injection.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/core/router/routes.dart';
import 'package:weather_app/core/service/datasource/remote/api_client.dart';
import 'package:weather_app/features/result/model/result_summary_model.dart';
import 'package:weather_app/helper/toast/toast_helper.dart';
import 'package:weather_app/utils/api_urls/api_urls.dart';
import 'package:weather_app/utils/config/app_config.dart';

class ResultSummaryController extends GetxController {
  final ApiClient apiClient = sl<ApiClient>();
  final Rx<ResultSummaryModel> resultSummaryModel = ResultSummaryModel().obs;
  final RxBool saveStationsLoading = false.obs;

  Future<void> saveStations({required Map<String, dynamic> body}) async {
    saveStationsLoading.value = true;
    var response = await apiClient.post(
      url: ApiUrls.saveStations(),
      body: body,
    );
    AppConfig.logger.i(body);
    AppConfig.logger.i(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      resultSummaryModel.value = ResultSummaryModel.fromJson(response.data);
      saveStationsLoading.value = false;
      AppToast.success(message: response.data['message']);
      AppRouter.route.pushNamed(
        RoutePath.saveScreen,
        extra: resultSummaryModel,
      );
    } else {
      AppConfig.logger.e(response.data);
      AppToast.error(message: response.data['message']);
      saveStationsLoading.value = false;
    }
  }
}
