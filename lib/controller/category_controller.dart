import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedCategory = "Apple".obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  String getApiUrl() {
    switch (selectedCategory.value) {
      case "Apple":
        return 'https://newsapi.org/v2/everything?q=apple&from=2025-03-03&to=2025-03-03&sortBy=popularity&apiKey=318123271b444e41b414c18aec72dd17';
      case "TechCrunch":
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=318123271b444e41b414c18aec72dd17';
      case "Wall Street":
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=318123271b444e41b414c18aec72dd17';
      case "Tesla":
        return 'https://newsapi.org/v2/everything?q=tesla&from=2025-02-04&sortBy=publishedAt&apiKey=318123271b444e41b414c18aec72dd17';
      case "Sport":
        return 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=318123271b444e41b414c18aec72dd17';
      default:
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=318123271b444e41b414c18aec72dd17';
    }
  }
}
