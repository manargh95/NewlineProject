import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../Model/DioHelper.dart';
import '../../Model/ModelTest/ModelTest.dart';

class MainScreenController extends GetxController {
  RxList<Currencies> newsList = <Currencies>[].obs;
  RxBool isLoading = true.obs;

  void fetchData() async {
    isLoading.value = true;

    try {
      final response = await DioHelper().fromJson('/api/currencies');
      if (response.statusCode == 200) {
        final responseData = response.data;
        final testModel = TestModel.fromJson(responseData);
        if (testModel.currencies != null) {
          newsList.value = testModel.currencies!;
        }
      } else {
        print('Error');
      }
    } catch (error) {
      print(error.toString());
    } finally {
      isLoading.value = false; // Set loading state to false after request completion
    }
  }
}
