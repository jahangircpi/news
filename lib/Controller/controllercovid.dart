import 'package:covid/Model/modelcovid19.dart';
import 'package:covid/Services/servicecovid19.dart';
import 'package:get/get.dart';

class controller extends GetxController {
  Rx<Covie19> countrieslists = Covie19().obs;
  var onlyCountry = List<Country>().obs;
  var searchFor = List<Country>().obs;
  var apicalled = Apicovid19();
  @override
  void onInit() {
    apicalled.fetchdata().then((value) {
      countrieslists.value = value;
      onlyCountry.value = countrieslists.value.countries;
      searchFor.value = countrieslists.value.countries;
    });

    super.onInit();
  }
}
