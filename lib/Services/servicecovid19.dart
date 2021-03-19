import 'package:covid/Model/modelcovid19.dart';
import 'package:http/http.dart' as http;

class Apicovid19 {
  var link = "https://api.covid19api.com/summary";
  Future fetchdata() async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return covie19FromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
