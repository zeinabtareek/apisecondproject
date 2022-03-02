
import 'package:get/get_rx/src/rx_types/rx_types.dart';


class ArticlesList {
   List<dynamic> ?articles =[].obs;
  ArticlesList({ this.articles});
  factory ArticlesList.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesList(
      articles: jsonData['articles'],
    );
  }
}