import 'package:apisecondproject/controller/article_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies (){
    Get.lazyPut(() => ArticelController());
  }
}