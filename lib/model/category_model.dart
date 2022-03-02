

class ArticleCategory {
  String? title;
  String? imageUrl;
  String? url;

  ArticleCategory({this.title, this.imageUrl,this.url});

  factory ArticleCategory.fromJson(Map<String, dynamic> jsonData) {
    return ArticleCategory(
        title: jsonData['title'],
        imageUrl: jsonData['urlToImage'],
        url: jsonData['url']);
  }
}

