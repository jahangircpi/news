import 'package:http/http.dart' as http;
import 'package:news/Model/category.dart';
import 'package:news/Model/headlinemodel.dart';

class NewsApi {
  var link =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=8454ed8e9a2b418d8227098efe5e343b";
  var link2 =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8454ed8e9a2b418d8227098efe5e343b";
  Future fetchdata() async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    } else {
      throw Exception("Api has problems to load");
    }
  }

  Future fetchdata2({category, country}) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=8454ed8e9a2b418d8227098efe5e343b"));
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      throw Exception("Api has problems to load");
    }
  }

  Future fetchdata3(
    country,
  ) async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=8454ed8e9a2b418d8227098efe5e343b"));
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    }
  }
}
