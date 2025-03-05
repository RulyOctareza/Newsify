class ApiEndpoints {
  static String getNewsUrl(String category, String apiKey) {
    switch (category) {
      case "Apple":
        return 'https://newsapi.org/v2/everything?q=apple&from=2025-03-03&to=2025-03-03&sortBy=popularity&apiKey=$apiKey';
      case "Tesla":
        return 'https://newsapi.org/v2/everything?q=tesla&from=2025-02-04&sortBy=publishedAt&apiKey=$apiKey';
      case "Wall Street":
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';
      case "Politics":
        return 'https://newsapi.org/v2/top-headlines?country=us&category=politics&apiKey=$apiKey';
      case "Tech Crunch":
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';
      case "Sport":
        return 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey';
      case "Error":
      return '';
      default:
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey';
    }
  }
}
