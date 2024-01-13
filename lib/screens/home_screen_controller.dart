import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test/models/niyo_data.dart';

class HomeScreenController extends GetxController {
  final dio = Dio();
  final isLoading = true.obs;
  final niyoDataList = <NiyoXData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        extractDataFromListOfJson(list: response.data);
        isLoading.toggle();
        print("Success");
      } else {
        isLoading.toggle();
        print("Response status code : " + response.statusCode.toString());
        print("Response status : " + response.statusMessage.toString());
      }
    } catch (e) {
      isLoading.toggle();
      print("Api Error : $e");
    }
  }

  void extractDataFromListOfJson({required List<dynamic> list}) {
    for (var item in list) {
      NiyoXData data = NiyoXData.fromJson(item);
      niyoDataList.add(data);
    }
    print(niyoDataList);
  }
}