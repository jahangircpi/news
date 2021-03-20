import 'package:get/get.dart';
import 'package:news/HomePage/GlobalCountriesfullName.dart';
import 'package:news/HomePage/globalcoutries.dart';
import 'package:news/Model/category.dart';
import 'package:news/Model/headlinemodel.dart';
import 'package:news/Service/headlineservice.dart';

class controller extends GetxController {
  Rx<News> topheadlinelists = News().obs;
  Rx<Category> category = Category().obs;
  Rx<Category> countries = Category().obs;

  var apicalled = NewsApi();
  @override
  void onInit() {
    apicalled.fetchdata().then((value) {
      topheadlinelists.value = value;
    });

    super.onInit();
  }
}
