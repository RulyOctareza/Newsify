class ApiEndpoints {
  static String getNewsUrl(String category, String apiKey) {
    switch (category) {
      case "Apple":
        return 'https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=$apiKey';
      case "TechCrunch":
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';
      case "Wall Street":
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey';
      case "Tesla":
        return 'https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=$apiKey';
      case "Sport":
        return 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey';
      default:
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';
    }
  }
}
