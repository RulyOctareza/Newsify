import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/data/api_endpoint.dart';

class CategoryController extends GetxController {
  var selectedCategory = "Apple".obs;
  final String apiKey = dotenv.env['NEWS_API_KEY'] ?? '';

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  String getApiUrl() {
    return ApiEndpoints.getNewsUrl(selectedCategory.value, apiKey);
  }
}
