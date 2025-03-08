class ApiEndpoints {
  static String getNewsUrl(String category, String apiKey) {
    switch (category) {
      case "Apple":
        return 'https://newsapi.org/v2/everything?q=apple&from=2025-03-07&to=2025-03-07&sortBy=popularity&apiKey=$apiKey';
      case "Tesla":
        return 'https://newsapi.org/v2/everything?q=tesla&from=2025-02-08&sortBy=publishedAt&apiKey=$apiKey';
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

  static String getSearchUrl(String keyword, String category, String apiKey) {
    switch (category) {
      case "Apple":
        return 'https://newsapi.org/v2/everything?q=$keyword&from=2025-03-03&to=2025-03-03&sortBy=popularity&apiKey=$apiKey';
      case "Tesla":
        return 'https://newsapi.org/v2/everything?q=$keyword&from=2025-02-08&sortBy=publishedAt&apiKey=$apiKey';
      case "Wall Street":
        return 'https://newsapi.org/v2/top-headlines?q=$keyword&country=us&category=business&apiKey=$apiKey';
      case "Politics":
        return 'https://newsapi.org/v2/top-headlines?q=$keyword&country=us&category=politics&apiKey=$apiKey';
      case "Tech Crunch":
        return 'https://newsapi.org/v2/top-headlines?q=$keyword&sources=techcrunch&apiKey=$apiKey';
      case "Sport":
        return 'https://newsapi.org/v2/top-headlines?q=$keyword&country=us&category=sports&apiKey=$apiKey';
      default:
        return 'https://newsapi.org/v2/everything?q=$keyword&domains=wsj.com&apiKey=$apiKey';
    }
  }
}
