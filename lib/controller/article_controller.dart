import 'package:apisecondproject/api/service.dart';
import 'package:apisecondproject/model/articel_model.dart';
import 'package:apisecondproject/model/category_model.dart';
import 'package:get/get.dart';

class ArticelController extends GetxController {
  FetchApis fetchApis = FetchApis();
  final articalesList = <Article>[].obs;
  final articalesListByCat = <ArticleCategory>[].obs;
  final categoryName =''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  fetchArticels(String category) async{
    articalesList.assignAll(await fetchApis.fetchdata(category));
  }


  fetchCategoryName(String category)async{

    await fetchApis.getCategoryName(category);
  }
}
