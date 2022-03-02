
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CategoryList {
  List<dynamic> ?articlesList =[].obs;
  CategoryList({ this.articlesList});
  factory CategoryList.fromJson(Map<String, dynamic> jsonData) {
    return CategoryList(
      articlesList: jsonData['articles'],
    );
  }
}